using System;
using System.Windows;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        IMemberRepository memberRepository;
        IProductRepository productRepository;
        IOrderRepository orderRepository;
        public Login(IMemberRepository repository, IProductRepository product, IOrderRepository order)
        {
            memberRepository = repository;
            productRepository = product;
            orderRepository = order;
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            String email = txtEmail.Text;
            String password = txtPass.Password;
            Member m = memberRepository.Login(email, password);
            Member member = memberRepository.GetMemberByEmail(email);
            if (m != null && email.Equals("admin@fstore.com"))
            {
                MainWindow mainWindow = new MainWindow(memberRepository, productRepository, orderRepository);
                Application.Current.Properties["member"] = m;
                mainWindow.Show();
                Close();
            }
            else if (m != null && !email.Equals("admin@fstore.com"))
            {
                OnlyMember window = new OnlyMember(memberRepository, orderRepository, m);
                window.txtEmail.Content = member.Email;
                window.txtCompany.Content = member.CompanyName;
                window.txtCountry.Content = member.Country;
                window.txtCity.Content = member.City;
                window.txtPassword.Content = member.Password;
                window.Show();
                Application.Current.Properties["member"] = m;
                Close();
            }
            else if (m == null)
            {
                MessageBox.Show("Email or Password incorrect", "Login");

            }
        }
        private void ExitButton_Click(System.Object sender, System.Windows.RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
