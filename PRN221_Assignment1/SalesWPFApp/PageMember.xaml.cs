using System;
using System.Windows;
using System.Windows.Controls;
using DataAccess.Models;
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for PageMember.xaml
    /// </summary>
    public partial class PageMember : Page
    {
        IMemberRepository memberRepository;

        public PageMember(IMemberRepository repository)
        {
            InitializeComponent();
            memberRepository = repository;
            LoadMemberList();
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            InsertMember insertMember = new InsertMember(memberRepository);
            insertMember.Show();
            LoadMemberList();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            Member member = null;
            try
            {
                member = (Member)lvMember.SelectedItems[0];
            }
            catch
            {
                MessageBox.Show($" please select a valid memeber", "select member");
                return;
            }

            UpdateMember updateMember = new UpdateMember(member, memberRepository);
            updateMember.txtEmail.Text = member.Email;
            updateMember.txtCompany.Text = member.CompanyName;
            updateMember.txtCity.Text = member.City;
            updateMember.txtCountry.Text = member.Country;
            updateMember.txtPassword.Text = member.Password;
            updateMember.txtId.Text = member.MemberId.ToString();
            updateMember.Show();
        }


        public void LoadMemberList()
        {
            lvMember.ItemsSource = memberRepository.GetMembers();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Member member = (Member)lvMember.SelectedItems[0];
                memberRepository.DeleteMember(member);
                LoadMemberList();
                MessageBox.Show($" delete successfully", "delete member");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "delete member");
            }
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadMemberList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load member list");
            }
        }
    }

}
