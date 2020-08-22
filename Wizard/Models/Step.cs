using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Data;

namespace Wizard.Models
{
    public class Step : IEntity
    {
        [Required]
        public Guid Id { get; set; }

        public ICollection<Item> Items { get; set; }
    }
}
