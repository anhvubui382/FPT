using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public interface IProductRepository
    {
        List<Product> getAllProducts();
        IEnumerable<Product> GetProducts();
        Product GetProductById(int ProductId);
        void InsertProduct(Product Product);
        void UpdateProduct(Product Product);
        void DeleteProduct(Product Product);

        IEnumerable<Product> Search(String keyword);
    }
}
