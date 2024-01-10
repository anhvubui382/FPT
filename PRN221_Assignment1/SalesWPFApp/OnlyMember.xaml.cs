using System.Windows;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for OnlyMember.xaml
    /// </summary>
    public partial class OnlyMember : Window
    {
        IMemberRepository memberRepository;
        IOrderRepository orderRepository;
        DataAccess.Models.Member Member;
      
        public OnlyMember(IMemberRepository repository, IOrderRepository OrderRepository, DataAccess.Models.Member m)
        {
            memberRepository = repository;
            orderRepository = OrderRepository;
            Member = m;
            InitializeComponent();
            lvOrder.ItemsSource = orderRepository.GetOrderByMember(Member.MemberId);

        }


        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            
           /* UpdateMember updateMember = new UpdateMember(Member, memberRepository);
            updateMember.txtEmail.Text = Member.Email;
            updateMember.txtCompany.Text = Member.CompanyName;
            updateMember.txtCity.Text = Member.City;
            updateMember.txtCountry.Text = Member.Country;
            updateMember.txtPassword.Text = Member.Password;
            updateMember.txtId.Text = Member.MemberId.ToString();
            updateMember.Show();
*/
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            LoadMemberList();
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
          /*  InsertOrder insertOrder = new InsertOrder(orderRepository);
            insertOrder.Show();*/
            
        }

        public void LoadMemberList()
        {
            
            lvOrder.ItemsSource = orderRepository.GetOrderByMember(Member.MemberId);
            DataAccess.Models.Member member = memberRepository.GetMemberById(Member.MemberId);
            txtEmail.Content = member.Email;
            txtCity.Content = member.City;
            txtCompany.Content = member.CompanyName;
            txtCountry.Content = member.Country;
            txtPassword.Content = member.Password;
        }
    }
}
