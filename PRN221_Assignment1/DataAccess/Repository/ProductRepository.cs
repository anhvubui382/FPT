using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class ProductRepository : IProductRepository
    {
        public void DeleteProduct(Product Product)
        => ProductDAO.Instance.Remove(Product);

        public List<Product> getAllProducts()
        {
            List<Product> products = new List<Product>(); try
            {
                var context = new FSTOREContext();
                products = context.Products.ToList();

            }catch (Exception ex)
            {
                throw new Exception(ex.Message);

            }
            return products;
        }

        public Product GetProductById(int ProductId)
        => ProductDAO.Instance.GetProductById(ProductId);

        public IEnumerable<Product> GetProducts()
        => ProductDAO.Instance.GetProductList();


        public void InsertProduct(Product Product)
        =>ProductDAO.Instance.AddNew(Product);

        public IEnumerable<Product> Search(string keyword)
        =>ProductDAO.Instance.Search(keyword);

        public void UpdateProduct(Product Product)
        => ProductDAO.Instance.Update(Product);
    }
}
