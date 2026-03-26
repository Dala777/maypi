import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Navigation } from 'app/core/navigation/navigation.types';
import { Observable, ReplaySubject, tap } from 'rxjs';
import { jwtDecode } from 'jwt-decode';
import { FuseNavigationItem } from '@fuse/components/navigation/navigation.types';  // Importación correcta

@Injectable({ providedIn: 'root' })
export class NavigationService {
    private _httpClient = inject(HttpClient);
    private _navigation: ReplaySubject<Navigation> = new ReplaySubject<Navigation>(1);

    /**
     * Getter for navigation
     */
    get navigation$(): Observable<Navigation> {
        return this._navigation.asObservable();
    }

    /**
     * Get all navigation data filtered by user roles
     */
    get(): Observable<Navigation> {
        // Decode token and extract roles (support accessToken + token keys)
        const token = localStorage.getItem('accessToken') ?? localStorage.getItem('token');
        let roles: number[] = [];

        if (token) {
            try {
                const decoded: any = jwtDecode(token);

                const normalizeRole = (roleValue: any): number | null => {
                    if (roleValue === null || roleValue === undefined) {
                        return null;
                    }

                    const roleNameMap: Record<string, number> = {
                        admin: 1,
                        cliente: 2,
                        visualizador: 3,
                        user: 2,
                        client: 2,
                        viewer: 3,
                    };

                    if (typeof roleValue === 'number') {
                        return roleValue;
                    }

                    if (typeof roleValue === 'string') {
                        const normalized = roleValue.toLowerCase();
                        if (roleNameMap[normalized]) {
                            return roleNameMap[normalized];
                        }

                        const parsed = Number(roleValue);
                        return Number.isNaN(parsed) ? null : parsed;
                    }

                    return null;
                };

                const rawRoles = decoded.roles ?? decoded.role;

                if (Array.isArray(rawRoles)) {
                    roles = rawRoles
                        .map((r: any) => normalizeRole(r))
                        .filter((r: number | null): r is number => r !== null);
                } else {
                    const normalized = normalizeRole(rawRoles);
                    if (normalized !== null) {
                        roles = [normalized];
                    }
                }

                //console.log('Roles extracted from token:', roles);  // Log de los roles extraídos
            } catch (error) {
                console.error('Error decoding token:', error);
            }
        } else {
            console.log('No token found in localStorage');
        }

        // Fetch navigation from the API (absolute path to avoid relative path issues)
        return this._httpClient.get<Navigation>('/api/common/navigation').pipe(
            tap((navigation) => {
                console.log('Raw navigation received:', navigation);  // Log de la navegación cruda recibida
                console.log('Extracted role IDs from token:', roles);

                // Filter the navigation based on roles (assuming roles are numeric and correspond to some logic)
                const filteredNavigation = this.filterNavigationByRole(navigation, roles);
                console.log('Filtered navigation:', filteredNavigation);  // Log de la navegación filtrada

                // Send filtered navigation to the ReplaySubject
                this._navigation.next(filteredNavigation);
            })
        );
    }

    // Method to filter navigation by roles
    private filterNavigationByRole(navigation: Navigation, roles: number[]): Navigation {
        //console.log('Filtering navigation with roles:', roles);  // Log de los roles para el filtrado
        return {
            compact: this.filterNavigationItems(navigation.compact, roles),
            default: this.filterNavigationItems(navigation.default, roles),
            futuristic: this.filterNavigationItems(navigation.futuristic, roles),
            horizontal: this.filterNavigationItems(navigation.horizontal, roles),
        };
    }

    private filterNavigationItems(items: FuseNavigationItem[], roles: number[]): FuseNavigationItem[] {
        return items
            .map(item => this.filterNavigationItem(item, roles))
            .filter((item): item is FuseNavigationItem => item !== null);
    }

    private filterNavigationItem(item: FuseNavigationItem, roles: number[]): FuseNavigationItem | null {
        const hasAccess = this.isAuthorizedForRole(item, roles);

        let children: FuseNavigationItem[] | undefined;

        if (item.children && item.children.length > 0) {
            children = this.filterNavigationItems(item.children, roles);
        }

        if (hasAccess || (children && children.length > 0)) {
            const filteredItem: FuseNavigationItem = {
                ...item,
                children,
            };
            return filteredItem;
        }

        return null;
    }

    // Method to check if an item is authorized for the given roles
    private isAuthorizedForRole(item: FuseNavigationItem, roles: number[]): boolean {
        //console.log('Checking if item is authorized:', item);  // Log de cada ítem de navegación
        // Assume each item has a 'roles' field indicating the roles that can access it
        if (!item.roles || item.roles.length === 0) {
            //console.log('Item has no roles specified, accessible by everyone');
            return true; // If no roles are specified, it's available to everyone
        }

        // Ensure roles are compared correctly
        const isAuthorized = item.roles.some(role => roles.includes(role));
        //console.log('Item authorization status:', isAuthorized);  // Log del resultado de la autorización
        return isAuthorized;
    }
}
