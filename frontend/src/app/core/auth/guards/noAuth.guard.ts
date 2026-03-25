import { inject } from '@angular/core';
import { CanActivateChildFn, CanActivateFn, Router } from '@angular/router';
import { AuthService } from 'app/core/auth/auth.service';
import { of, switchMap } from 'rxjs';

export const NoAuthGuard: CanActivateFn | CanActivateChildFn = (route, state) =>
{
    const router: Router = inject(Router);

    // Check the authentication status
    return inject(AuthService).check().pipe(
        switchMap((authenticated) =>
        {
            // If the user is authenticated...
            if ( authenticated )
            {
                // Redirigir a la página de admin (signed-in-redirect)
                // en lugar de a '' para evitar loops infinitos
                router.navigateByUrl('/signed-in-redirect');
                return of(false);  // Denegar acceso a esta ruta
            }

            // Allow the access
            return of(true);
        }),
    );
};

