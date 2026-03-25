/* eslint-disable */
import { FuseNavigationItem } from '@fuse/components/navigation';

export const defaultNavigation1: FuseNavigationItem[] = [
    {
        id      : 'apps.help-center',
        title   : 'CENTRO DE AYUDA',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:question-mark-circle',
        children: [
            {
                id   : 'apps.help-center.faqs',
                title: 'Preguntas Frecuentes',
                type : 'basic',
                icon : 'heroicons_outline:chat-bubble-left-ellipsis',
                link : '/apps/help-center/faqs',
                roles: [1, 2],
            },
            {
                id   : 'apps.help-center.guides',
                title: 'Guías',
                type : 'basic',
                icon : 'heroicons_outline:book-open',
                link : '/apps/help-center/guides',
                roles: [1, 2],
            },
            {
                id   : 'apps.help-center.chatia',
                title: 'Chat IA',
                type : 'basic',
                icon : 'heroicons_outline:cpu-chip',
                link : '/apps/help-center/chatia',
                roles: [1, 2],
            },
        ],
    },
    {
        id      : 'apps.search-rescue',
        title   : 'BÚSQUEDA Y RESCATE',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:magnifying-glass',
        children: [
            {
                id      : 'apps.search-rescue.tracking',
                title   : 'Reporte de Trackeo',
                type    : 'basic',
                icon    : 'heroicons_outline:map-pin',
                link    : '/apps/search-rescue/tracking',
                roles   : [1, 2],
            },
            {
                id      : 'apps.search-rescue.emergency',
                title   : 'Solicitudes de Ayuda Botón de Emergencia',
                type    : 'basic',
                icon    : 'heroicons_outline:exclamation-triangle',
                link    : '/apps/search-rescue/emergency',
                roles   : [1, 2],
            },
        ]
    },
    {
        id      : 'apps.prevention',
        title   : 'PREPARACIÓN Y PREVENCIÓN',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:shield-check',
        children: [
            {
                id      : 'apps.prevention.contacts',
                title   : 'Mis Contactos de Emergencia',
                type    : 'basic',
                icon    : 'heroicons_outline:phone',
                link    : '/apps/prevention/contacts',
                roles   : [1, 2],
            },
            {
                id      : 'apps.prevention.tracking-codes',
                title   : 'Mis Códigos de Rastreo',
                type    : 'basic',
                icon    : 'heroicons_outline:qr-code',
                link    : '/apps/prevention/tracking-codes',
                roles   : [1, 2],
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
                id   : 'apps.configuration.categories',
                title: 'Categorías',
                type : 'basic',
                icon : 'heroicons_outline:tag',
                link : '/dashboards/categories',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.guides',
                title: 'Guías',
                type : 'basic',
                icon : 'heroicons_outline:document-text',
                link : '/dashboards/guides',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.faqs',
                title: 'Preguntas Frecuentes',
                type : 'basic',
                icon : 'heroicons_outline:chat-bubble-left-right',
                link : '/dashboards/faqs',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.devices',
                title: 'Dispositivos',
                type : 'basic',
                icon : 'heroicons_outline:device-phone-mobile',
                link : '/dashboards/devices',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.emergency-contacts',
                title: 'Contactos de Emergencia',
                type : 'basic',
                icon : 'heroicons_outline:phone-arrow-up-right',
                link : '/dashboards/emergency-contacts',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.missing-requests',
                title: 'Solicitud de Desaparecidos',
                type : 'basic',
                icon : 'heroicons_outline:user-minus',
                link : '/dashboards/missing',
                roles: [1, 2],
            },
            {
                id   : 'apps.configuration.missing-reports',
                title: 'Reporte de Solicitudes de Desaparecidos',
                type : 'basic',
                icon : 'heroicons_outline:document-chart-bar',
                link : '/dashboards/reports',
                roles: [1, 2],
            },
        ],
    }
];

export const compactNavigation1: FuseNavigationItem[] = defaultNavigation1;
export const futuristicNavigation1: FuseNavigationItem[] = defaultNavigation1;
export const horizontalNavigation1: FuseNavigationItem[] = defaultNavigation1;