import {
  Component,
  ViewEncapsulation,
  ViewChild,
  ElementRef,
  AfterViewInit,
  OnInit,
  OnDestroy,
  inject,
  ChangeDetectorRef,
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatTabsModule } from '@angular/material/tabs';
import { RouterLink, ActivatedRoute } from '@angular/router';
import { ChatbotComponent } from 'app/modules/landing/chatbot/chatbot.component';
import { MatMenuModule } from '@angular/material/menu';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Component({
  selector: 'app-derecho',
  templateUrl: './derecho.component.html',
  encapsulation: ViewEncapsulation.None,
  standalone: true,
  imports: [
    CommonModule,
    MatButtonModule,
    MatIconModule,
    MatTabsModule,
    ChatbotComponent,
    RouterLink,
    MatMenuModule,
  ],
})
export class DerechoComponent implements OnInit, AfterViewInit, OnDestroy {
  @ViewChild('maypiContainer', { read: ElementRef }) maypiContainer: ElementRef | null = null;
  @ViewChild('ruta3Container', { read: ElementRef }) ruta3Container: ElementRef | null = null;

  isMenuOpen = false;
  currentYear = new Date().getFullYear();
  selectedTab = 0;

  maypiContent: SafeHtml = '';
  ruta3Content: SafeHtml = '';

  // Rastrear si los scripts ya fueron inicializados para no duplicarlos
  private maypiInitialized = false;
  private ruta3Initialized = false;

  // MutationObservers para detectar cuándo el innerHTML realmente está en el DOM
  private maypiObserver: MutationObserver | null = null;
  private ruta3Observer: MutationObserver | null = null;

  private sanitizer = inject(DomSanitizer);
  private route = inject(ActivatedRoute);
  private cdr = inject(ChangeDetectorRef);

  ngOnInit(): void {
    this.route.queryParams.subscribe((params) => {
      if (params['tab']) {
        this.selectedTab = parseInt(params['tab'], 10);
      }
    });

    this.loadMaypiContent();
    this.loadRuta3Content();
  }

  ngAfterViewInit(): void {
    // Los containers ya existen en el DOM; si el fetch terminó antes que AfterViewInit,
    // ejecutamos los scripts ahora. Si no, el observer del fetch lo hará.
    if (this.maypiContent && !this.maypiInitialized) {
      this.initContainer(this.maypiContainer, 'maypi');
    }
    if (this.ruta3Content && !this.ruta3Initialized) {
      this.initContainer(this.ruta3Container, 'ruta3');
    }
  }

  ngOnDestroy(): void {
    this.maypiObserver?.disconnect();
    this.ruta3Observer?.disconnect();
  }

  loadMaypiContent(): void {
    fetch('/assets/derecho/maypi-content.html')
      .then((r) => r.text())
      .then((html) => {
        this.maypiContent = this.sanitizer.bypassSecurityTrustHtml(html);
        this.maypiInitialized = false; // reset para que se inicialice con el nuevo contenido
        this.cdr.detectChanges(); // forzar que Angular actualice el [innerHTML] ahora mismo

        // Después del detectChanges el DOM ya tiene el nuevo HTML; inicializamos scripts
        this.initContainer(this.maypiContainer, 'maypi');
      })
      .catch((e) => console.error('[derecho] Error loading Maypi:', e));
  }

  loadRuta3Content(): void {
    fetch('/assets/derecho/ruta3-content.html')
      .then((r) => r.text())
      .then((html) => {
        this.ruta3Content = this.sanitizer.bypassSecurityTrustHtml(html);
        this.ruta3Initialized = false;
        this.cdr.detectChanges();

        this.initContainer(this.ruta3Container, 'ruta3');
      })
      .catch((e) => console.error('[derecho] Error loading Ruta3:', e));
  }

  /**
   * Inicializa los scripts de un contenedor UNA SOLA VEZ.
   * Si el container todavía no está en el DOM (ViewChild null), usa un
   * MutationObserver para esperar a que Angular lo inserte.
   */
  private initContainer(ref: ElementRef | null, name: 'maypi' | 'ruta3'): void {
    const alreadyDone = name === 'maypi' ? this.maypiInitialized : this.ruta3Initialized;
    if (alreadyDone) return;

    if (!ref?.nativeElement) {
      // El ViewChild todavía no existe (raro pero posible en el primer ciclo).
      // Observamos el padre para reintentar cuando aparezca.
      this.waitForContainer(name);
      return;
    }

    const container: HTMLElement = ref.nativeElement;

    // Verificar que el contenido ya fue insertado por Angular
    if (!container.children.length) {
      this.waitForContainer(name);
      return;
    }

    this.runScripts(container, name);
  }

  /**
   * Usa MutationObserver para esperar a que el contenedor tenga hijos
   * (es decir, que Angular haya terminado de renderizar [innerHTML]).
   */
  private waitForContainer(name: 'maypi' | 'ruta3'): void {
    // Desconectar observer previo si existe
    if (name === 'maypi') {
      this.maypiObserver?.disconnect();
    } else {
      this.ruta3Observer?.disconnect();
    }

    const getRef = () => (name === 'maypi' ? this.maypiContainer : this.ruta3Container);

    const observer = new MutationObserver(() => {
      const ref = getRef();
      if (ref?.nativeElement?.children.length) {
        observer.disconnect();
        this.runScripts(ref.nativeElement, name);
      }
    });

    // Observar el body como fallback hasta que el container aparezca
    observer.observe(document.body, { childList: true, subtree: true });

    if (name === 'maypi') {
      this.maypiObserver = observer;
    } else {
      this.ruta3Observer = observer;
    }
  }

  /**
   * Extrae y ejecuta los <script> del container en su propio scope.
   * Cada script recibe el container como contexto para que los
   * querySelector apunten al elemento correcto y nunca a otro tab.
   *
   * Se ejecuta UNA SOLA VEZ por carga de contenido.
   */
  private runScripts(container: HTMLElement, name: 'maypi' | 'ruta3'): void {
    const scripts = Array.from(container.querySelectorAll('script'));

    scripts.forEach((oldScript, i) => {
      try {
        if (oldScript.src) {
          // Script externo: reemplazar para forzar carga
          const s = document.createElement('script');
          s.src = oldScript.src;
          s.async = true;
          oldScript.replaceWith(s);
        } else if (oldScript.textContent?.trim()) {
          // Script inline: ejecutar en un scope que recibe el container
          // Esto evita que document.getElementById encuentre el elemento equivocado
          // cuando ambos tabs están en el DOM al mismo tiempo.
          const code = oldScript.textContent;
          // eslint-disable-next-line no-new-func
          const fn = new Function('__container__', `
            // Parchamos getElementById/querySelector temporalmente dentro del script
            // para que operen sobre el container correcto.
            (function(document){
              ${code}
            })({
              getElementById: function(id){ return __container__.querySelector('#' + id); },
              querySelector: function(sel){ return __container__.querySelector(sel); },
              querySelectorAll: function(sel){ return __container__.querySelectorAll(sel); },
              body: __container__,
              readyState: 'complete',
              addEventListener: window.addEventListener.bind(window),
              removeEventListener: window.removeEventListener.bind(window),
            });
          `);
          fn(container);
          oldScript.remove(); // evitar re-ejecución accidental
        }
        console.log(`[derecho] Script ${i} de "${name}" ejecutado OK`);
      } catch (err) {
        console.warn(`[derecho] Error en script ${i} de "${name}":`, err);
      }
    });

    if (name === 'maypi') {
      this.maypiInitialized = true;
    } else {
      this.ruta3Initialized = true;
    }
  }

  toggleMenu(): void {
    this.isMenuOpen = !this.isMenuOpen;
  }

  onTabChange(event: { index: number }): void {
    // Los scripts ya están inicializados y viven en el DOM; no hay que re-ejecutar nada.
    // Solo necesitamos asegurarnos de que, si por alguna razón el tab que se activa
    // todavía no fue inicializado (edge case: tab que nunca se mostró), lo hacemos ahora.
    if (event.index === 0 && !this.maypiInitialized) {
      this.initContainer(this.maypiContainer, 'maypi');
    } else if (event.index === 1 && !this.ruta3Initialized) {
      this.initContainer(this.ruta3Container, 'ruta3');
    }
  }
}