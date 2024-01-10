using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;

namespace _26_BuiAnhVu_Assignment2.Pages.Products
{
    public class DetailsModel : PageModel
    {
        private readonly _26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context _context;

        public DetailsModel(_26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context context)
        {
            _context = context;
        }

      public Product Product { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Product == null)
            {
                return NotFound();
            }

            var product = await _context.Product.FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }
            else 
            {
                Product = product;
            }
            return Page();
        }
    }
}
