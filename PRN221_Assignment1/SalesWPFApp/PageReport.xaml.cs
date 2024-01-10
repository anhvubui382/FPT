using System;
using System.Windows;
using System.Windows.Controls;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for PageReport.xaml
    /// </summary>
    public partial class PageReport : Page
    {
        IOrderRepository OrderRepository;
        public PageReport(IOrderRepository repository)
        {
            InitializeComponent();
            OrderRepository = repository;
        }

        private void btnReport_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(dpStartDate.Text) && !string.IsNullOrEmpty(dpEndDate.Text))
            {
                lvReport.ItemsSource = OrderRepository.Report(DateTime.Parse(dpStartDate.Text), DateTime.Parse(dpEndDate.Text));
            }
        }
    }
}
