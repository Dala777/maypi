import { Injectable } from '@angular/core';
import { FuseNavigationItem } from '@fuse/components/navigation';
import { FuseMockApiService } from '@fuse/lib/mock-api';
import { jwtDecode } from 'jwt-decode';
import { compactNavigation, defaultNavigation, futuristicNavigation, horizontalNavigation } from 'app/mock-api/common/navigation/data';
import { compactNavigation1, defaultNavigation1, futuristicNavigation1, horizontalNavigation1 } from 'app/mock-api/common/navigation/data1';
import { compactNavigation2, defaultNavigation2, futuristicNavigation2, horizontalNavigation2 } from 'app/mock-api/common/navigation/data2';
import { compactNavigation3, defaultNavigation3, futuristicNavigation3, horizontalNavigation3 } from 'app/mock-api/common/navigation/data3';
import { cloneDeep } from 'lodash-es';

@Injectable({ providedIn: 'root' })
export class NavigationMockApi {
    private _compactNavigation: FuseNavigationItem[] = [];
    private _defaultNavigation: FuseNavigationItem[] = [];
    private _futuristicNavigation: FuseNavigationItem[] = [];
    private _horizontalNavigation: FuseNavigationItem[] = [];

    constructor(private _fuseMockApiService: FuseMockApiService) {
        this.registerHandlers();
    }

    registerHandlers(): void {
        const navigationHandler = () => {
            //console.log('Obteniendo la navegación desde el API Mock.');

            // Obtener los roles del usuario
            const userRoles = this._getUserRoles();
            console.log('Roles del usuario obtenidos:', userRoles);

            // Asignar datos según los roles del usuario (prioriza admin > cliente > visualizador)
            this._setNavigationDataBasedOnRole(userRoles);

            // Preparar la respuesta con la navegación asignada
            const response = {
                compact: cloneDeep(this._compactNavigation),
                default: cloneDeep(this._defaultNavigation),
                futuristic: cloneDeep(this._futuristicNavigation),
                horizontal: cloneDeep(this._horizontalNavigation),
            };

            console.log('Respuesta final de la API Mock:', response);

            return [200, response] as [number, any];
        };
        this._fuseMockApiService.onGet('api/common/navigation').reply(navigationHandler);
        this._fuseMockApiService.onGet('/api/common/navigation').reply(navigationHandler);
    }

    private _getUserRoles(): number[] {
        let token = localStorage.getItem('accessToken') ?? localStorage.getItem('token');
        console.log('Token in localStorage at userRoles resolution:', token);

        if (!token) {
            console.error('No se encontró el token en localStorage');
            return [];
        }

        // Some flows may store token with Bearer prefix
        if (token.startsWith('Bearer ')) {
            token = token.replace('Bearer ', '');
        }

        try {
            const decoded: any = jwtDecode(token);
            console.log('Decoded token for userRoles:', decoded);

            const roleNameMap: Record<string, number> = {
                admin: 1,
                cliente: 2,
                visualizador: 3,
                user: 2,
                client: 2,
                viewer: 3,
            };

            const normalizeRole = (roleValue: any): number | null => {
                if (roleValue === null || roleValue === undefined) {
                    return null;
                }

                if (typeof roleValue === 'number') {
                    return roleValue;
                }

                if (typeof roleValue === 'string') {
                    const lower = roleValue.toLowerCase();
                    if (roleNameMap[lower]) {
                        return roleNameMap[lower];
                    }

                    const parsed = Number(roleValue);
                    return Number.isNaN(parsed) ? null : parsed;
                }

                return null;
            };

            const rawRoles = decoded.roles ?? decoded.role;
            let roles: number[] = [];

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

            // If no numeric roles found, fallback to role IDs in stored user profile
            if (roles.length === 0) {
                const userStr = localStorage.getItem('user');
                if (userStr) {
                    const user = JSON.parse(userStr);

                    if (user?.roles && Array.isArray(user.roles) && user.roles.length > 0) {
                        roles = user.roles
                            .map((r: any) => normalizeRole(r))
                            .filter((r: number | null): r is number => r !== null);
                    }

                    if (roles.length === 0 && user?.role) {
                        const fallback = normalizeRole(user.role);
                        if (fallback !== null) {
                            roles = [fallback];
                        }
                    }
                }
            }

            // Fallback definitivo: si el token no tiene roles, asignar cliente (2) para que no use control admin por defecto.
            if (roles.length === 0) {
                console.warn('No se encontró rol en token ni user, usando cliente como fallback.');
                roles = [2];
            }

            console.log('Roles finales resolvidos:', roles);
            return roles;
        } catch (error) {
            console.error('Error al decodificar el token', error);
            return [2];
        }
    }

    private _setNavigationDataBasedOnRole(roles: number[]): void {
        const roleNameMap: Record<string, number> = {
            admin: 1,
            cliente: 2,
            visualizador: 3,
            user: 2,
            client: 2,
            viewer: 3,
        };

        const normalizeRole = (roleValue: number | string): number | null => {
            if (roleValue === null || roleValue === undefined) {
                return null;
            }

            if (typeof roleValue === 'number') {
                return roleValue;
            }

            const normalized = roleValue.toLowerCase();
            if (roleNameMap[normalized]) {
                return roleNameMap[normalized];
            }

            const parsed = Number(roleValue);
            return Number.isNaN(parsed) ? null : parsed;
        };

        const normalizedRoles = roles
            .map((role) => normalizeRole(role))
            .filter((role): role is number => role !== null);

        if (normalizedRoles.includes(1)) {
            this._compactNavigation = compactNavigation1;
            this._defaultNavigation = defaultNavigation1;
            this._futuristicNavigation = futuristicNavigation1;
            this._horizontalNavigation = horizontalNavigation1;
            return;
        }

        if (normalizedRoles.includes(2)) {
            this._compactNavigation = compactNavigation2;
            this._defaultNavigation = defaultNavigation2;
            this._futuristicNavigation = futuristicNavigation2;
            this._horizontalNavigation = horizontalNavigation2;
            return;
        }

        if (normalizedRoles.includes(3)) {
            this._compactNavigation = compactNavigation3;
            this._defaultNavigation = defaultNavigation3;
            this._futuristicNavigation = futuristicNavigation3;
            this._horizontalNavigation = horizontalNavigation3;
            return;
        }

        console.warn(`Rol desconocido (${roles}), usando la navegación por defecto.`);
        this._compactNavigation = compactNavigation;
        this._defaultNavigation = defaultNavigation;
        this._futuristicNavigation = futuristicNavigation;
        this._horizontalNavigation = horizontalNavigation;
    }
}
