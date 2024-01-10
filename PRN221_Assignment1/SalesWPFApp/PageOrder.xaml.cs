using System;
using System.Windows;
using System.Windows.Controls;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for PageOrder.xaml
    /// </summary>
    public partial class PageOrder : Page
    {
        IOrderRepository OrderRepository;

        public PageOrder(IOrderRepository repository)
        {
            InitializeComponent();
            OrderRepository = repository;
            LoadOrderList();


        }


        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            InsertOrder insertOrder = new InsertOrder(OrderRepository);
            insertOrder.Show();
            LoadOrderList();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            Order Order = null;
            try
            {
                Order = (Order)lvOrder.SelectedItems[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show($" please select a valid order", "select order");
                return;
            }
            UpdateOrder updateOrder = new UpdateOrder(Order, OrderRepository);
            updateOrder.txtMemberId.Text = Order.MemberId.ToString();
            updateOrder.dateRequiredDate.Text = Order.RequiredDate.ToString();
            updateOrder.dateOrderDate.Text = Order.OrderDate.ToString();
            updateOrder.dateShippedDate.Text = Order.ShippedDate.ToString();
            updateOrder.txtFreight.Text = Order.Freight.ToString();
            updateOrder.txtId.Text = Order.OrderId.ToString();
            updateOrder.Show();
        }


        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadOrderList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load Order list");
            }
        }

        public void LoadOrderList()
        {
            lvOrder.ItemsSource = OrderRepository.GetOrders();
        }


        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Order Order = (Order)lvOrder.SelectedItems[0];
                OrderRepository.DeleteOrder(Order);
                LoadOrderList();
                MessageBox.Show($" delete successfully", "delete Order");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "delete Order");
            }
        }


    }

}
