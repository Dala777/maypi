import { CommonModule } from "@angular/common"
import { Component, type OnInit, ViewEncapsulation, inject } from "@angular/core" // ← Agregué inject
import { MatButtonModule } from "@angular/material/button"
import { MatIconModule } from "@angular/material/icon"
import { RouterLink } from "@angular/router"
import { PublicService } from "./services/public.service" // ← Quité el type
import { BehaviorSubject, combineLatest, debounceTime, distinctUntilChanged, switchMap, tap } from "rxjs"
import { FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from "@angular/forms"
import type { ContactSupportStore } from "app/modules/dashboard/models/contact-support"
import { ChatbotComponent } from "app/modules/landing/chatbot/chatbot.component"

@Component({
  selector: "landing-home",
  templateUrl: "./home.component.html",
  encapsulation: ViewEncapsulation.None,
  standalone: true,
  imports: [
    MatButtonModule,
    RouterLink,
    MatIconModule,
    CommonModule,
    FormsModule,
    ChatbotComponent,
    ReactiveFormsModule,
  ],
})
export class LandingHomeComponent implements OnInit {
  // ← Usar inject() en lugar del constructor
  private _publicService = inject(PublicService)

  // Propiedad para controlar la visibilidad del menú móvil
  isMenuOpen = false
  // Propiedad para mostrar el año actual en el footer
  currentYear: number = new Date().getFullYear()

  persons_list = [
    {
      name: "Nataniel L. Heardy",
      age: 25,
      height: 1.8,
      weight: 80,
      hair: "Liso",
      emergency_contact: "+591 12345678",
      last_location: "Calle 123 Nº 1 Provincia Buenos Aires de la ciudad de Cochabamba",
    },
    {
      name: "Nataniel L. Heardy",
      age: 25,
      height: 1.8,
      weight: 80,
      hair: "Liso",
      emergency_contact: "+591 12345678",
      last_location: "Calle 123 Nº 1 Provincia Buenos Aires de la ciudad de Cochabamba",
    },
    {
      name: "Nataniel L. Heardy",
      age: 25,
      height: 1.8,
      weight: 80,
      hair: "Liso",
      emergency_contact: "+591 12345678",
      last_location: "Calle 123 Nº 1 Provincia Buenos Aires de la ciudad de Cochabamba",
    },
    {
      name: "Lucal Obregon",
      age: 25,
      height: 1.8,
      weight: 80,
      hair: "Liso",
      emergency_contact: "+591 12345678",
      last_location: "Calle 123 Nº 1 Provincia Buenos Aires de la ciudad de Cochabamba",
    },
    {
      name: "Nataniel L. Heardy",
      age: 25,
      height: 1.8,
      weight: 80,
      hair: "Liso",
      emergency_contact: "+591 12345678",
      last_location: "Calle 123 Nº 1 Provincia Buenos Aires de la ciudad de Cochabamba",
    },
    {
      name: "Nataniel L. Heardy",
      age: 25,
      height: 1.8,
      weight: 80,
      hair: "Liso",
      emergency_contact: "+591 12345678",
      last_location: "Calle 123 Nº 1 Provincia Buenos Aires de la ciudad de Cochabamba",
    },
  ]

  currentBlock = 0

  get paginatedList() {
    const start = this.currentBlock * 6
    return this.persons_list.slice(start, start + 6)
  }

  nextBlock() {
    if (this.hasNextPage) {
      this.pageNumber$.next(this.pageNumber$.value - 1)
    }
  }

  prevBlock() {
    if (this.hasPreviousPage) {
      this.pageNumber$.next(this.pageNumber$.value + 1)
    }
  }

  contactSupportForm = {
    submitted: false,
    submitting: false,
    success: false,
    formGroup: new FormGroup({
      user_id: new FormControl<number>(null),
      name: new FormControl<string>("", Validators.required),
      email: new FormControl<string>("", [Validators.required, Validators.email]),
      title: new FormControl<string>("", Validators.required),
      message: new FormControl<string>("", Validators.required),
    }),
  }

  get Form() {
    return this.contactSupportForm.formGroup.controls
  }

  formSubmit() {
    console.log(this.contactSupportForm.formGroup.getRawValue())
    this.contactSupportForm.submitted = true
    this.contactSupportForm.success = false

    if (this.contactSupportForm.formGroup.valid) {
      this.contactSupportForm.submitting = true
      const newContactSupport: ContactSupportStore = this.contactSupportForm.formGroup.getRawValue()

      // Simulación para frontend
      setTimeout(() => {
        this.contactSupportForm.submitting = false
        this.contactSupportForm.success = true
        this.contactSupportForm.submitted = false

        // Limpiar formulario
        this.contactSupportForm.formGroup.reset()

        // Ocultar mensaje después de 5 segundos
        setTimeout(() => {
          this.contactSupportForm.success = false
        }, 5000)

        // Scroll al mensaje de éxito
        setTimeout(() => {
          const successElement = document.querySelector(".bg-green-50")
          if (successElement) {
            successElement.scrollIntoView({ behavior: "smooth", block: "center" })
          }
        }, 100)
      }, 2000)

      // Llamada real comentada temporalmente
      /*
            this._publicService
                .storeContactSupport(newContactSupport)
                .subscribe({
                    next: (res: any) => window.location.reload(),
                    error: (error) => console.log(error),
                });
            */
    }
  }

  hasNextPage = false
  hasPreviousPage = false
  pageSize$ = new BehaviorSubject<number>(10)
  pageNumber$ = new BehaviorSubject<number>(1)

  missingList$ = combineLatest([this.pageSize$, this.pageNumber$]).pipe(
    debounceTime(300),
    distinctUntilChanged(),
    switchMap(() =>
      this._publicService
        .listMissing(
          Number.parseInt(this.pageNumber$.value.toString()),
          Number.parseInt(this.pageSize$.value.toString()),
        )
        .pipe(
          tap((res: any) => {
            console.log(res)
            this.hasNextPage = res.links.next != null
            this.hasPreviousPage = res.links.previous != null
          }),
        ),
    ),
  )

  pageGuideSize$ = new BehaviorSubject<number>(10)
  pageGuideNumber$ = new BehaviorSubject<number>(1)

  guideList$ = combineLatest([this.pageGuideSize$, this.pageGuideNumber$]).pipe(
    debounceTime(300),
    distinctUntilChanged(),
    switchMap(() =>
      this._publicService
        .listGuides(
          Number.parseInt(this.pageGuideNumber$.value.toString()),
          Number.parseInt(this.pageGuideSize$.value.toString()),
        )
        .pipe(
          tap((res: any) => {
            console.log(res)
          }),
        ),
    ),
  )

  // ← Eliminar el constructor ya que usamos inject()
  ngOnInit(): void {}

  // Método para alternar la visibilidad del menú móvil
  toggleMenu(): void {
    this.isMenuOpen = !this.isMenuOpen
  }
}
