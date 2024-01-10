using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;

namespace _26_BuiAnhVu_Assignment2.Pages.Customers
{
    public class DeleteModel : PageModel
    {
        private readonly _26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context _context;

        public DeleteModel(_26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context context)
        {
            _context = context;
        }

        [BindProperty]
      public Customer Customer { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Customer == null)
            {
                return NotFound();
            }

            var customer = await _context.Customer.FirstOrDefaultAsync(m => m.customerId == id);

            if (customer == null)
            {
                return NotFound();
            }
            else 
            {
                Customer = customer;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.Customer == null)
            {
                return NotFound();
            }
            var customer = await _context.Customer.FindAsync(id);

            if (customer != null)
            {
                Customer = customer;
                _context.Customer.Remove(Customer);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
