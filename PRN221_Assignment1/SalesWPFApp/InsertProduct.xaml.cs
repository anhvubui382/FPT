using System;
using System.Windows;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for InsertProduct.xaml
    /// </summary>
    public partial class InsertProduct : Window
    {
        IProductRepository ProductRepository;
        public InsertProduct(IProductRepository repository)
        {
            InitializeComponent();
            ProductRepository = repository;
        }


        private Product GetProductObject()
        {
            Product Product = null;
            try
            {
                Product = new Product
                {
                    ProductName = (txtProductName.Text),
                    Weight = txtWeight.Text,
                    UnitPrice = int.Parse(txtUnitPrice.Text),
                    UnitslnStock = int.Parse(txtUnitslnStock.Text),
                    CategoryId = int.Parse(txtCategoryId.Text)
                };

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "get Product");
            }
            return Product;
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Product Product = GetProductObject();
                ProductRepository.InsertProduct(Product);
                PageProduct pageProduct = new PageProduct(ProductRepository);
                pageProduct.LoadProductList();
                MessageBox.Show($" inssert successfully", "insert Product");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Insert Product");
            }
        }
    }
}
