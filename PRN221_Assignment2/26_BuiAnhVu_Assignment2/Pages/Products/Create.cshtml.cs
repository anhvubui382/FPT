using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;

namespace _26_BuiAnhVu_Assignment2.Pages.Products
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
        ViewData["CategoryID"] = new SelectList(_context.Set<Category>(), "categoryId", "categoryId");
        ViewData["SupplierID"] = new SelectList(_context.Set<Supplier>(), "SupplierID", "SupplierID");
            return Page();
        }

        [BindProperty]
        public Product Product { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.Product == null || Product == null)
            {
                return Page();
            }

            _context.Product.Add(Product);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
