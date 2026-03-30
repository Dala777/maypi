/* eslint-disable */
import { FuseNavigationItem } from '@fuse/components/navigation';

export const defaultNavigation1: FuseNavigationItem[] = [
    {
        id      : 'apps.search-rescue',
        title   : 'BÚSQUEDA Y RESCATE',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:magnifying-glass',
        children: [
            {
                id   : 'apps.search-rescue.emergency',
                title: 'Solicitudes de Ayuda Botón de Emergencia',
                type : 'basic',
                icon : 'heroicons_outline:exclamation-triangle',
                link : '/apps/search-rescue/emergency',
                roles: [1, 2],
            },
        ]
    },
    {
        id      : 'apps.configuration',
        title   : 'CONFIGURACIÓN',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:cog-6-tooth',
        children: [
            {
                id   : 'apps.configuration.users',
                title: 'Usuarios',
                type : 'basic',
                icon : 'heroicons_outline:users',
                link : '/dashboards/users',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.missing-requests',
                title: 'Reportes de Desaparecidos',
                type : 'basic',
                icon : 'heroicons_outline:user-minus',
                link : '/dashboards/missing',
                roles: [1, 2],
            },
        ],
    }
];

export const compactNavigation1: FuseNavigationItem[] = defaultNavigation1;
export const futuristicNavigation1: FuseNavigationItem[] = defaultNavigation1;
export const horizontalNavigation1: FuseNavigationItem[] = defaultNavigation1;