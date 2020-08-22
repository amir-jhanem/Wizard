import { Step } from './models/Step';
import { Injectable, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Item } from './models/Item';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class WizardService {

  private apiEndPoint = this.baseUrl + 'Wizard/';

  constructor(private http: HttpClient, @Inject('BASE_URL') private baseUrl: string) {}

  public GetSteps():Observable<Step[]>{
    return this.http.get<Step[]>(this.apiEndPoint + 'GetSteps');
  }

  public GetItems(stepId: string):Observable<Item[]>{
    return this.http.get<Item[]>(this.apiEndPoint + 'GetItems?stepId='+ stepId);
  }

  public AddStep():Observable<Step>{
    return this.http.post<Step>(this.apiEndPoint + 'AddStep', null);
  }

  public RemoveStep(id: string):Observable<any>{
    return this.http.delete(this.apiEndPoint + 'RemoveStep?id='+ id);
  }

  public AddItem(item: Item):Observable<Item>{
    return this.http.post<Item>(this.apiEndPoint + 'AddItem', item);
  }

  public EditItem(item: Item):Observable<Item>{
    return this.http.post<Item>(this.apiEndPoint + 'EditItem', item);
  }

  public RemoveItem(id: string, stepId: string):Observable<any>{
    return this.http.delete(`${this.apiEndPoint}RemoveItem?id=${id}&stepId=${stepId}`);
  }
}
