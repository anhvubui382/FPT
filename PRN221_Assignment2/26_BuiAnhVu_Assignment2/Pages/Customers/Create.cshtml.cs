using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace _26_BuiAnhVu_Assignment2.Pages.Customers
{
    
    public class CreateModel : PageModel
    {
        private readonly _26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context _context;

        public CreateModel(_26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public Customer Customer { get; set; } = default!;
        [BindProperty]
        public UserType UserType { get; set; } = default!;
         
        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          

            _context.Customer.Add(Customer);
            try
            {
                await _context.SaveChangesAsync();

            }
            catch (DbUpdateException ex)
            {
                ModelState.AddModelError("Customer.username", "Username already exists");
                return Page();
            }

            return RedirectToPage("./Index");
        }
    }

	
}
