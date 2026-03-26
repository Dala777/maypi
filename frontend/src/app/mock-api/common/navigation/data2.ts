/* eslint-disable */
import { FuseNavigationItem } from '@fuse/components/navigation';

export const defaultNavigation2: FuseNavigationItem[] = [
    {
        id      : 'apps.prevention',
        title   : 'PREPARACIÓN Y PREVENCIÓN',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:shield-check',
        children: [
            {
                id      : 'apps.prevention.contacts',
                title   : 'Contactos de Emergencia',
                type    : 'basic',
                icon    : 'heroicons_outline:phone',
                link    : '/apps/prevention/contacts',
                roles   : [2],
            },
        ]
    },
    {
        id      : 'apps.help-center',
        title   : 'CENTRO DE AYUDA',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:question-mark-circle',
        children: [
            {
                id   : 'apps.help-center.chatia',
                title: 'Chat IA',
                type : 'basic',
                icon : 'heroicons_outline:cpu-chip',
                link : '/apps/help-center/chatia',
                roles: [2],
            },
        ],
    },
    {
        id      : 'pages.settings',
        title   : 'CONFIGURACIÓN',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:cog-6-tooth',
        children: [
            {
                id   : 'pages.settings',
                title: 'Configuración',
                type : 'basic',
                icon : 'heroicons_outline:cog-8-tooth',
                link : '/pages/settings',
                roles: [2],
            },
        ],
    },
    {
        id      : 'landing',
        title   : 'PÁGINA PRINCIPAL',
        subtitle: '',
        type    : 'group',
        icon    : 'heroicons_outline:home',
        children: [
            {
                id   : 'landing.return',
                title: 'Volver a la Landing',
                type : 'basic',
                icon : 'heroicons_outline:arrow-left',
                link : '/landing',
                roles: [2],
            },
        ],
    },
];

export const compactNavigation2: FuseNavigationItem[] = defaultNavigation2;
export const futuristicNavigation2: FuseNavigationItem[] = defaultNavigation2;
export const horizontalNavigation2: FuseNavigationItem[] = defaultNavigation2;