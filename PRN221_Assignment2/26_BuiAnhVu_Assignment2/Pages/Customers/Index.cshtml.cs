using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;
using Microsoft.AspNetCore.Authorization;

namespace _26_BuiAnhVu_Assignment2.Pages.Customers
{
    [Authorize(Policy = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly _26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context _context;

        public IndexModel(_26_BuiAnhVu_Assignment2.Data._26_BuiAnhVu_Assignment2Context context)
        {
            _context = context;
        }

        public IList<Customer> Customer { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Customer != null)
            {
                Customer = await _context.Customer.ToListAsync();
            }
        }
    }
}
