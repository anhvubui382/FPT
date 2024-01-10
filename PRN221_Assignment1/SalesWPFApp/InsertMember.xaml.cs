using System;
using System.Windows;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for InsertMember.xaml
    /// </summary>
    public partial class InsertMember : Window
    {
        IMemberRepository memberRepository;
        public InsertMember(IMemberRepository repository)
        {
            
            memberRepository = repository;
        }


        private Member GetMemberObject()
        {
            Member member = null;
            try
            {
                member = new Member
                {
                    Email = (txtEmail.Text),
                    CompanyName = txtCompany.Text,
                    City = txtCity.Text,
                    Country = (txtCountry.Text),
                    Password = (txtPassword.Text)
                };

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "get member");
            }
            return member;
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Member member = GetMemberObject();
                memberRepository.InsertMember(member);
                MessageBox.Show($"{member.Email} inssert successfully", "insert member");
                Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Insert member");
            }
        }
    }
}
