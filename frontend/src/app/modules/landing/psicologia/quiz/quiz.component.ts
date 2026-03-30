import {
  Component,
  OnInit,
  ViewChild,
  ElementRef,
  AfterViewInit,
  inject,
} from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-psicologia-quiz',
  template: `<div #htmlContainer class="quiz-wrapper"></div>`,
  styles: [`
    .quiz-wrapper {
      padding: 20px 0;
      width: 100%;
    }
  `],
  standalone: true,
  imports: [CommonModule],
})
export class PsicologiaQuizComponent implements OnInit, AfterViewInit {
  @ViewChild('htmlContainer', { read: ElementRef })
  htmlContainer: ElementRef | null = null;

  ngOnInit(): void {
    this.loadHtmlAndInitializeQuiz();
  }

  ngAfterViewInit(): void {
    // Aquí se ejecutan los scripts después de que Angular renderice
  }

  private loadHtmlAndInitializeQuiz(): void {
    if (!this.htmlContainer) {
      setTimeout(() => this.loadHtmlAndInitializeQuiz(), 100);
      return;
    }

    fetch('/assets/modules/landing/psicologia/quiz/quiz.html')
      .then((r) => r.text())
      .then((html) => {
        // Inyectar directamente el HTML
        if (this.htmlContainer) {
          this.htmlContainer.nativeElement.innerHTML = html;
          
          // Esperar a que el DOM se actualice y luego ejecutar scripts
          setTimeout(() => {
            this.executeQuizScripts();
          }, 100);
        }
      })
      .catch((e) => console.error('[quiz] Error loading quiz:', e));
  }

  private executeQuizScripts(): void {
    if (!this.htmlContainer) return;

    // Obtener los scripts del contenedor inyectado
    const scripts = this.htmlContainer.nativeElement.querySelectorAll('script');
    
    scripts.forEach((originalScript: HTMLScriptElement) => {
      // Crear un nuevo script y ejecutarlo globalmente
      const newScript = document.createElement('script');
      newScript.type = 'text/javascript';
      newScript.textContent = originalScript.textContent;
      
      // Ejecutar el script en el contexto global
      document.body.appendChild(newScript);
      document.body.removeChild(newScript);
    });
  }
}