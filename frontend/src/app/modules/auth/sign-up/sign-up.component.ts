import { NgIf } from '@angular/common';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {
    FormControl,
    FormGroup,
    FormsModule,
    ReactiveFormsModule,
    Validators,
} from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { Router, RouterLink } from '@angular/router';
import { fuseAnimations } from '@fuse/animations';
import { FuseAlertComponent, FuseAlertType } from '@fuse/components/alert';
import { MatSelectModule } from '@angular/material/select';
import { MatOptionModule } from '@angular/material/core';
import { trigger, transition, style, animate } from '@angular/animations';
import { PublicService } from 'app/modules/landing/home/services/public.service';

@Component({
    selector: 'auth-sign-up',
    templateUrl: './sign-up.component.html',
    encapsulation: ViewEncapsulation.None,
    animations: [
        fuseAnimations,
        trigger('shake', [
            transition('* => error', [
                style({ transform: 'translateX(0)' }),
                animate('100ms', style({ transform: 'translateX(-10px)' })),
                animate('100ms', style({ transform: 'translateX(10px)' })),
                animate('100ms', style({ transform: 'translateX(-10px)' })),
                animate('100ms', style({ transform: 'translateX(10px)' })),
                animate('100ms', style({ transform: 'translateX(0)' })),
            ]),
        ]),
    ],
    standalone: true,
    imports: [
        RouterLink, NgIf, FuseAlertComponent, FormsModule, ReactiveFormsModule,
        MatFormFieldModule, MatInputModule, MatButtonModule, MatIconModule,
        MatCheckboxModule, MatProgressSpinnerModule, MatSelectModule, MatOptionModule,
    ],
})
export class AuthSignUpComponent implements OnInit {

    alert: { type: FuseAlertType; message: string } = {
        type: 'success',
        message: '',
    };

    showAlert: boolean = false;

    signUpForm = {
        submitted: false,
        submitting: false,
        formGroup: new FormGroup({
            name: new FormControl<string>('', Validators.required),
            last_name: new FormControl<string>('', Validators.required),
            second_surname: new FormControl<string>(''),  // opcional
            email: new FormControl<string>('', [Validators.required, Validators.email]),
            password: new FormControl<string>('', Validators.required),
            phone: new FormControl<number>(null, Validators.required),
            avatar: new FormControl<File>(null),  // opcional
        }),
    };

    get Form() {
        return this.signUpForm.formGroup.controls;
    }

    onFileChange(event: Event, field: string) {
        const input = event.target as HTMLInputElement;
        if (input.files && input.files.length > 0) {
            this.signUpForm.formGroup.patchValue({ [field]: input.files[0] });
        }
    }

    constructor(
        private _router: Router,
        private _publicService: PublicService
    ) {}

    ngOnInit(): void {}

    buildUserStoreFormData(data: any): FormData {
        const formData = new FormData();
        formData.append('name', data.name);
        formData.append('last_name', data.last_name);
        formData.append('second_surname', data.second_surname || '');
        formData.append('email', data.email);
        formData.append('phone', data.phone.toString());
        formData.append('password', data.password);
        if (data.avatar) {
            formData.append('avatar', data.avatar);
        }
        return formData;
    }

    formSubmit(): void {
        this.signUpForm.submitted = true;
        if (this.signUpForm.formGroup.valid) {
            this.signUpForm.formGroup.disable();
            const newUser = this.signUpForm.formGroup.getRawValue();
            const formData = this.buildUserStoreFormData(newUser);

            this._publicService.storeUser(formData).subscribe({
                next: () => {
                    // Redirigir al login directamente, sin confirmación de correo
                    this._router.navigateByUrl('/sign-in');
                },
                error: (error) => {
                    this.signUpForm.formGroup.enable();
                    this.alert = {
                        type: 'error',
                        message: 'Ha ocurrido un error al registrarse. Intente nuevamente.',
                    };
                    this.showAlert = true;
                    console.error(error);
                },
            });
        }
    }
}