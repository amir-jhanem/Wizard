import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { WizardComponent } from './wizard/wizard.component';
import { WizardService } from './wizard.service';

@NgModule({
  declarations: [
    AppComponent,
    WizardComponent,
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: WizardComponent, pathMatch: 'full' },
    ])
  ],
  providers: [WizardService],
  bootstrap: [AppComponent]
})
export class AppModule { }
