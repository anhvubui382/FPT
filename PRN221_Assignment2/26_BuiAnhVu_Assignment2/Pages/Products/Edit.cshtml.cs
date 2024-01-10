using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;

namespace _26_BuiAnhVu_Assignment2.Pages.Products
{
    public class EditModel : PageModel
    {
        private readonly _26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context _context;

        public EditModel(_26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context context)
        {
            _context = context;
        }

        [BindProperty]
        public Product Product { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Product == null)
            {
                return NotFound();
            }

            var product =  await _context.Product.FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }
            Product = product;
           ViewData["CategoryID"] = new SelectList(_context.Set<Category>(), "categoryId", "categoryId");
           ViewData["SupplierID"] = new SelectList(_context.Set<Supplier>(), "SupplierID", "SupplierID");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(Product.ProductId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool ProductExists(int id)
        {
          return (_context.Product?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
