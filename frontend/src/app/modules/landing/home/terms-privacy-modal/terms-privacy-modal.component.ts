import { Component, ViewEncapsulation } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatTabsModule } from '@angular/material/tabs';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-terms-privacy-modal',
  templateUrl: './terms-privacy-modal.component.html',
  styleUrls: ['./terms-privacy-modal.component.scss'],
  encapsulation: ViewEncapsulation.None,
  standalone: true,
  imports: [CommonModule, MatDialogModule, MatTabsModule, MatButtonModule, MatIconModule],
})
export class TermsPrivacyModalComponent {
  selectedTabIndex = 0;

  constructor(public dialogRef: MatDialogRef<TermsPrivacyModalComponent>) {}

  onClose(): void {
    this.dialogRef.close();
  }
}
