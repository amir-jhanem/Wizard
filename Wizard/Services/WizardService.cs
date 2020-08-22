using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Data.EFCore;
using Wizard.Models;

namespace Wizard.Services
{
    public class WizardService : IWizardService
    {
        private readonly EfCoreItemRepository efCoreItemRepository;
        private readonly EfCoreStepRepository efCoreStepRepository;

        public WizardService(EfCoreItemRepository efCoreItemRepository, EfCoreStepRepository efCoreStepRepository)
        {
            this.efCoreItemRepository = efCoreItemRepository;
            this.efCoreStepRepository = efCoreStepRepository;
        }

        public async Task<List<Step>> GetSteps()
        {
            return await efCoreStepRepository.GetAll();
        }

        public async Task<Step> AddStep()
        {
            var step = new Step { Id = Guid.NewGuid() };

            return await efCoreStepRepository.Add(step);
        }

        public async Task RemoveStep(Guid id)
        {
            await efCoreStepRepository.Delete(id);
        }

        public async Task<List<Item>> GetItems(Guid stepId)
        {
            return await efCoreItemRepository.GetItemsByStepId(stepId);
        }

        public async Task<Item> AddItem(Item item)
        {
            item.Id = Guid.NewGuid();

            return await efCoreItemRepository.Add(item);
        }

        public async Task<Item> EditItem(Item item)
        {
            return await efCoreItemRepository.Update(item);
        }

        public async Task RemoveItem(Guid id, Guid stepId)
        {
            await efCoreItemRepository.Delete(id, stepId);
        }
    }
}
