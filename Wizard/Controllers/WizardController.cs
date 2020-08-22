using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Wizard.Models;
using Wizard.Services;

namespace Wizard.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WizardController : ControllerBase
    {
        private readonly ILogger<WizardController> _logger;
        private readonly IWizardService _service;

        public WizardController(IWizardService service, ILogger<WizardController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet]
        [Route(nameof(GetSteps))]
        public async Task<ActionResult> GetSteps()
        {
            var result = await _service.GetSteps();
            return Ok(result);
        }

        [HttpGet]
        [Route(nameof(GetItems))]
        public async Task<ActionResult> GetItems([FromQuery] Guid stepId)
        {
            var result = await _service.GetItems(stepId);
            return Ok(result);
        }

        [HttpPost]
        [Route(nameof(AddStep))]
        public async Task<ActionResult> AddStep()
        {
            var result = await _service.AddStep();
            return Ok(result);
        }

        [HttpDelete]
        [Route(nameof(RemoveStep))]
        public async Task<ActionResult> RemoveStep([FromQuery] Guid id)
        {
            await _service.RemoveStep(id);
            return Ok();
        }

        [HttpPost]
        [Route(nameof(AddItem))]
        public async Task<ActionResult> AddItem([FromBody] Item item)
        {
            var result = await _service.AddItem(item);
            return Ok(result);
        }

        [HttpPost]
        [Route(nameof(EditItem))]
        public async Task<ActionResult> EditItem([FromBody] Item item)
        {
            var result = await _service.EditItem(item);
            return Ok(result);
        }

        [HttpDelete]
        [Route(nameof(RemoveItem))]
        public async Task<ActionResult> RemoveItem([FromQuery] Guid id, [FromQuery] Guid stepId)
        {
            await _service.RemoveItem(id, stepId);
            return Ok();
        }
    }
}
