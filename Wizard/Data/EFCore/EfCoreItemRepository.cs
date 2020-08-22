using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Models;

namespace Wizard.Data.EFCore
{
    public class EfCoreItemRepository : EfCoreRepository<Item, WizardDbContext>
    {
        private readonly WizardDbContext Context;
        public EfCoreItemRepository(WizardDbContext context) : base(context)
        {
            Context = context;
        }

        public async Task<List<Item>> GetItemsByStepId(Guid stepId)
        {
            return await Context.Item.Where(x => x.StepId == stepId).ToListAsync();
        }

        public async Task Delete(Guid id, Guid stepId)
        {
            var item = await Context.Item.SingleOrDefaultAsync(x => x.Id == id && x.StepId == stepId);
            Context.Item.Remove(item);

            await Context.SaveChangesAsync();
        }
    }
}
