import { Component, ViewEncapsulation } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatTabsModule } from '@angular/material/tabs';
import { RouterLink } from '@angular/router';
import { ChatbotComponent } from 'app/modules/landing/chatbot/chatbot.component';
import { MatMenuModule } from '@angular/material/menu';
import { PsicologiaQuizComponent } from './quiz/quiz.component';

@Component({
  selector: 'app-psicologia',
  templateUrl: './psicologia.component.html',
  encapsulation: ViewEncapsulation.None,
  standalone: true,
  imports: [
    CommonModule,
    MatButtonModule,
    MatIconModule,
    MatTabsModule,
    ChatbotComponent,
    RouterLink,
    MatMenuModule,
    PsicologiaQuizComponent,
  ],
})
export class PsicologiaComponent {
  isMenuOpen: boolean = false;
  currentYear: number = new Date().getFullYear();

  toggleMenu(): void {
    this.isMenuOpen = !this.isMenuOpen;
  }
}