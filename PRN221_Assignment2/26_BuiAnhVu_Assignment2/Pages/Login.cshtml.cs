using _26_BuiAnhVu_Assignment2.Data;
using _26_BuiAnhVu_Assignment2.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;
using System.Security.Claims;

namespace _26_BuiAnhVu_Assignment2.Pages
{
    public class User
    {
        [Required(ErrorMessage = "Username must be input value!")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Password must be input value!")]
        public string Password { get; set; }
    }
    public class LoginModel : PageModel
    {
        private readonly _26_BuiAnhVu_Assignment2Context _context;
        public LoginModel(_26_BuiAnhVu_Assignment2Context context)
        {
            _context = context;
        }

        [BindProperty]
        public User User { get; set; }
        
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                Customer? customer = _context.Customer.SingleOrDefault(
                    x => x.username == User.Username && x.password == User.Password
                    );
                if (customer == null)
                {
                    ModelState.AddModelError("Error", "Wrong username or password.");
                    return Page();
                }
                else
                {
                    var claims = new List<Claim>()
                    {
                        new Claim(ClaimTypes.NameIdentifier, customer.username),
                        new Claim("Role", customer.type.ToString())
                    };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                    var authProperties = new AuthenticationProperties
                    {
                        AllowRefresh = true,
                        IsPersistent = true
                    };

                    await HttpContext.SignInAsync(
                            CookieAuthenticationDefaults.AuthenticationScheme,
                            new ClaimsPrincipal(claimsIdentity),
                            authProperties
                            );

                    return RedirectToPage("./Index");
                }
            }
            return Page();
        }
    }
}
