import { Component } from '@angular/core';
import { Step } from '../models/Step';
import { Item } from '../models/Item';
import { WizardService } from '../wizard.service';

@Component({
  selector: 'wizard',
  templateUrl: './wizard.component.html',
  styleUrls: ['./wizard.component.css'],
})

export class WizardComponent {
  private steps: Step[];
  private items: Item[];
  private currentStep: number;
  private currentItem: Item;

  constructor(private service: WizardService) {
    service.GetSteps().subscribe(steps => {
      this.steps = steps
      this.setCurrentStep(0)
      this.intiateCurrentItem()
    })
  }

  setCurrentStep(index: number) {
    let stepId = this.steps[index].id
    this.service.GetItems(stepId).subscribe(items => {
      this.items = items
      this.currentStep = index
    })
  }

  setCurrentItem(index: number) {
    this.currentItem = Object.create(this.items[index])
  }

  intiateCurrentItem() {
    this.currentItem = {
      id: "00000000-0000-0000-0000-000000000000",
      title: "",
      description: "",
      stepId: "00000000-0000-0000-0000-000000000000"
    }
  }

  addStep() {
    this.service.AddStep().subscribe(step => this.steps.push(step))
  }

  removeStep(id: string) {
    this.service.RemoveStep(id).subscribe(x => {
      let step = this.steps.find(x => x.id == id)
      let stepIdx = this.steps.indexOf(step, 0)
      this.steps.splice(stepIdx, 1)
  
      this.setCurrentStep(0)
    })
  }

  removeItem(id: string) {
    let stepId = this.steps[this.currentStep].id

    this.service.RemoveItem(id, stepId).subscribe(x => {
      let item = this.items.find(x => x.id == id)
      let itemIdx = this.items.indexOf(item, 0)
      this.items.splice(itemIdx, 1)
      this.intiateCurrentItem()
    })
  }

  onSubmit() {
    if (this.currentItem.id == "00000000-0000-0000-0000-000000000000") {
      this.currentItem.stepId = this.steps[this.currentStep].id
      this.service.AddItem(this.currentItem).subscribe(item => {
        this.items.push(item)

        this.intiateCurrentItem()
      })
    }
    else {
      let newItem : Item= {
        id: this.currentItem.id,
        title: this.currentItem.title,
        stepId: this.currentItem.stepId,
        description: this.currentItem.description,
      }

      this.service.EditItem(newItem).subscribe(item => {
        let editedItem = this.items.find(x => x.id == item.id);
        let itemIdx = this.items.indexOf(editedItem, 0)
        this.items[itemIdx] = this.currentItem

        this.intiateCurrentItem()
      })
    }
  }
}





