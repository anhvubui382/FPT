using DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    internal class ProductDAO
    {
        private static ProductDAO instance = null;
        private static readonly object instanceLock = new object();
        private ProductDAO() { }
        public static ProductDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new ProductDAO();
                    }
                }
                return instance;
            }
        }
        public IEnumerable<Product> GetProductList()
        {
            List<Product> Products;
            try
            {
                var myStockDB = new FSTOREContext();
                Products = myStockDB.Products.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Products;
        }
        public Product GetProductById(int ProductId)
        {
            Product Product = null;
            try
            {
                var myStockDB = new FSTOREContext();
                Product = myStockDB.Products.SingleOrDefault(Product => Product.ProductId == ProductId);

            }
            catch (Exception ex) { throw new Exception(ex.Message); }
            return Product;
        }


        public void AddNew(Product Product)
        {
            try
            {
                Product _Product = GetProductById(Product.ProductId);
                if (_Product == null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Products.Add(Product);
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Product is already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public void Update(Product Product)
        {
            try
            {
                Product c = GetProductById(Product.ProductId);
                if (c != null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Entry<Product>(Product).State = EntityState.Modified;
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Product does not already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(Product Product)
        {
            try
            {
                Product c = GetProductById(Product.ProductId);
                if (c != null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Products.Remove(Product);
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Product does not already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IEnumerable<Product> Search(String keyword)
        {
            List<Product> Products;
            var myStockDB = new FSTOREContext();
            try
            {
                Products = myStockDB.Products
                                    .Where(Product => Product.ProductName.Contains(keyword) || Product.ProductId == Convert.ToInt32(keyword)
                                    || Product.UnitPrice == Convert.ToInt32(keyword) || Product.UnitslnStock == Convert.ToInt32(keyword)).ToList();
            }
            catch (Exception ex)
            {
                Products = myStockDB.Products
                                    .Where(Product => Product.ProductName.Contains(keyword)).ToList();
            }
            return Products;
        }
    }
}
