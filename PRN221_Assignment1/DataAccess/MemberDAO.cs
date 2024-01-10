using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;

namespace DataAccess
{
    internal class MemberDAO
    {
        private static MemberDAO instance = null;
        private static readonly object instanceLock = new object();
        private MemberDAO() { }
        public static MemberDAO Insance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new MemberDAO();
                    }
                }
                return instance;
            }
        }


        public IEnumerable<Member> GetMemberList()
        {
            List<Member> Members;
            try
            {
                var myStockDB = new FSTOREContext();
                Members = myStockDB.Members.ToList();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Members;
        }

        public Member GetMemberById(int MemberId)
        {
            Member Member = null;
            try
            {
                var myStockDB = new FSTOREContext();
                Member = myStockDB.Members.SingleOrDefault(Member => Member.MemberId == MemberId);

            }
            catch (Exception ex) { throw new Exception(ex.Message); }
            return Member;
        }

        public Member GetMemberByEmail(String email)
        {
            Member Member = null;
            try
            {
                var myStockDB = new FSTOREContext();
                Member = myStockDB.Members.SingleOrDefault(Member => Member.Email == email);

            }
            catch (Exception ex) { throw new Exception(ex.Message); }
            return Member;
        }

        public void AddNew(Member Member)
        {
            try
            {
                Member _Member = GetMemberById(Member.MemberId);
                if (_Member == null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Members.Add(Member);
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Member is already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public void Update(Member Member)
        {
            try
            {
                Member c = GetMemberById(Member.MemberId);
                if (c != null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Entry<Member>(Member).State = EntityState.Modified;
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Member does not already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(Member Member)
        {
            try
            {
                Member c = GetMemberById(Member.MemberId);
                if (c != null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Members.Remove(Member);
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Member does not already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public Member Login(String email, String password)
        {
            Member Member = null;
            try
            {
                var myStockDB = new FSTOREContext();
                Member = myStockDB.Members.SingleOrDefault(Member => Member.Email == email && Member.Password == password);
            }
            catch (Exception ex) { throw new Exception(ex.Message); }
            return Member;
        }
    }
}

