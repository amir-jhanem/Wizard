using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Models;

namespace Wizard.Services
{
    public interface IWizardService
    {
        Task<List<Step>> GetSteps();
        Task<List<Item>> GetItems(Guid stepId);

        Task<Step> AddStep();
        Task RemoveStep(Guid id);

        Task<Item> AddItem(Item item);
        Task<Item> EditItem(Item item);
        Task RemoveItem(Guid id, Guid stepId);
    }
}
