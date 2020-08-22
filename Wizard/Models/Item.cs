using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Wizard.Data;

namespace Wizard.Models
{
    public class Item : IEntity
    {
        public Guid Id { get; set; }
        [Required]
        public Guid StepId { get; set; }
        [Required]
        [StringLength(50)]
        public string Title { get; set; }
        [Required]
        [StringLength(100)]
        public string Description { get; set; }

        public Step Step { get; set; }
    }
}
