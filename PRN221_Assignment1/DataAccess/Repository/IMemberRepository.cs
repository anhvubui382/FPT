using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;

namespace DataAccess.Repository
{
    public interface IMemberRepository
    {
        IEnumerable<Member> GetMembers();
        Member GetMemberById(int MemberId);

        Member GetMemberByEmail(String email);
        void InsertMember(Member Member);
        void UpdateMember(Member Member);
        void DeleteMember(Member Member);

        Member Login(String Email, String Password);
    }
}
