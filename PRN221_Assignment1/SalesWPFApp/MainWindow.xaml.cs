using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Printing;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        IMemberRepository memberRepository;
        IOrderRepository orderRepository;
        IProductRepository productRepository;
        public MainWindow(IMemberRepository repository, IProductRepository ProductRepository, IOrderRepository OrderRepository)
        {
            productRepository = ProductRepository;
            memberRepository = repository;
            productRepository = ProductRepository;
            
            InitializeComponent();
            frMain.Content = new PageMember(memberRepository);
        }

        private void btnToPageMember_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new PageMember(memberRepository);
        }

        private void btnToPageProduct_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new PageProduct(productRepository);
        }

        private void btnToPageOrder_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new PageOrder(orderRepository);
        }

        private void btnToPageReport_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new PageReport(orderRepository);
        }
    }
}
