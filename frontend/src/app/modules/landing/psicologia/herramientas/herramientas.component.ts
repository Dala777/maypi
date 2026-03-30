import { Component, OnInit, ViewChild, ElementRef, AfterViewInit, inject } from "@angular/core"
import { DomSanitizer, SafeHtml } from "@angular/platform-browser"
import { CommonModule } from "@angular/common"

@Component({
  selector: "app-psicologia-herramientas",
  templateUrl: "./herramientas.component.html",
  standalone: true,
  imports: [CommonModule],
})
export class PsicologiaHerramientasComponent implements OnInit, AfterViewInit {
  htmlContent: SafeHtml = ""
  @ViewChild("htmlContainer", { read: ElementRef }) htmlContainer: ElementRef | null = null
  private sanitizer = inject(DomSanitizer)

  ngOnInit(): void {
    this.loadHtmlContent()
  }

  ngAfterViewInit(): void {
    this.executeScripts()
  }

  loadHtmlContent(): void {
    // Cargar el contenido HTML del archivo
    fetch("/assets/modules/landing/psicologia/herramientas/herramientas.html")
      .then((response) => response.text())
      .then((html) => {
        this.htmlContent = this.sanitizer.bypassSecurityTrustHtml(html)
      })
      .catch((error) => console.error("[v0] Error loading HTML:", error))
  }

  executeScripts(): void {
    if (this.htmlContainer) {
      const scripts = this.htmlContainer.nativeElement.querySelectorAll("script")
      scripts.forEach((script: HTMLScriptElement) => {
        const newScript = document.createElement("script")
        newScript.textContent = script.textContent
        newScript.src = script.src
        if (script.src) {
          newScript.async = true
        }
        this.htmlContainer?.nativeElement.appendChild(newScript)
      })
    }
  }
}
