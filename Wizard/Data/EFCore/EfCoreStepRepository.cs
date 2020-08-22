using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Models;

namespace Wizard.Data.EFCore
{
    public class EfCoreStepRepository : EfCoreRepository<Step, WizardDbContext>
    {
        private readonly WizardDbContext Context;
        public EfCoreStepRepository(WizardDbContext context) : base(context)
        {
            Context = context;
        }

        public async override Task<Step> Delete(Guid id)
        {
            var entity = await Context.Step.Include(x => x.Items).SingleOrDefaultAsync(x => x.Id == id);
            Context.Set<Item>().RemoveRange(entity.Items);
            Context.Set<Step>().Remove(entity);
            await Context.SaveChangesAsync();

            return entity;
        }
    }
}
