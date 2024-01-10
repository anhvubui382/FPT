using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;

namespace DataAccess.Repository
{
    public class MemberRepository : IMemberRepository
    {
        public void DeleteMember(Member Member) => MemberDAO.Insance.Remove(Member);

        public Member GetMemberByEmail(string email)
        => MemberDAO.Insance.GetMemberByEmail(email);

        public Member GetMemberById(int MemberId) => MemberDAO.Insance.GetMemberById(MemberId);


        public IEnumerable<Member> GetMembers()
        => MemberDAO.Insance.GetMemberList();

        public void InsertMember(Member Member)
        => MemberDAO.Insance.AddNew(Member);

        public Member Login(string Email, string Password)

        => MemberDAO.Insance.Login(Email, Password);


        public void UpdateMember(Member Member)
        => MemberDAO.Insance.Update(Member);
    }
}
