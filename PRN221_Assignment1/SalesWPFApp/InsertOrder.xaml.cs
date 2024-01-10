using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for InsertOrder.xaml
    /// </summary>
    public partial class InsertOrder : Window
    {
        IOrderRepository OrderRepository;

        class OrderTemp
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
            public decimal Total { get; set; }
        }
        public InsertOrder(IOrderRepository repository)
        {
            InitializeComponent();
            List<Product> products = new ProductRepository().getAllProducts();
            cb_product.ItemsSource = products;
            OrderRepository = repository;
        }



        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            Product? product = cb_product.SelectedItem as Product;

            try
            {
                int num = int.Parse(tb_quantity.Text);
                if (num <= 0)
                {
                    MessageBox.Show("Quantity must be a number greater than 0", "Error");
                }
                else
                {
                    OrderTemp order = new OrderTemp()
                    {
                        ProductId = product.ProductId,
                        ProductName = product.ProductName,
                        Price = product.UnitPrice,
                        Quantity = int.Parse(tb_quantity.Text),
                        Total = product.UnitPrice * int.Parse(tb_quantity.Text)
                    };
                    lvCarts.Items.Add(order);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Quantity must be a number", "Error");
            }
        }

        private void btn_order_Click(object sender, RoutedEventArgs e)
        {
            Member? member = Application.Current.Properties["member"] as Member;
            List<OrderTemp> list = new List<OrderTemp>();
            for (int i = 0; i < lvCarts.Items.Count; i++)
            {
                OrderTemp? temp = lvCarts.Items[i] as OrderTemp;
                Order order = new Order()
                {
                    MemberId = member.MemberId,
                    OrderDate = DateTime.Now,
                };
                new OrderRepository().InsertOrder(order);
                //TODO: get id just create
                int orderId = new OrderRepository().getIdJustCreate();
                OrderDetail detail = new OrderDetail()
                {
                    OrderId = orderId,
                    ProductId = temp.ProductId,
                    UnitPrice = temp.Price,
                    Quantity = temp.Quantity,
                    Discount = 0
                };
                new OrderDetailRepository().insertOrderDetail(detail);
            }

            MessageBox.Show("Place order successful", "Place order");
            Close();
        }

        private void btn_cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void cb_product_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Product? p = cb_product.SelectedItem as Product;
            tb_price.Text = p.UnitPrice.ToString();
        }
    }
}
