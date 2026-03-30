import { Routes } from '@angular/router';
import { LandingHomeComponent } from 'app/modules/landing/home/home.component';
import { ReportComponent } from 'app/modules/landing/home/report/report.component';
import { FaqsPageComponent } from './faqs-page/faqs-page.component';
import { GuidesPageComponent } from './guides-page/guides-page.component';
import { GuidesComponent } from 'app/modules/landing/guides/guides.component';
import { FaqsComponent } from 'app/modules/landing/faqs/faqs.component';
import { DerechoComponent } from "app/modules/landing/derecho/derecho.component"
import { PsicologiaComponent } from "app/modules/landing/psicologia/psicologia.component"

export default [
    { path: '', pathMatch: 'full', redirectTo: 'landing' },

    {
        path: 'landing',
        component: LandingHomeComponent,
    },
    {
        path: 'report',
        component: ReportComponent,
    },
    {
        path     : 'guides',
        component: GuidesComponent
    },
    {
        path     : 'faqs',
        component: FaqsComponent
    },
    {
        path: "derecho",
        component: DerechoComponent,
    },
    {
        path: "psicologia",
        component: PsicologiaComponent,
    },
] as Routes;
