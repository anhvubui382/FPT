using DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    internal class OrderDAO
    {
        private static OrderDAO instance = null;
        public static readonly object instanceLock = new object();  
        public OrderDAO() { }
        public static OrderDAO Instance
        {
            get { 
                lock(instanceLock)
                {
                    if(instance==null)
                    {
                        instance = new OrderDAO();
                    }
                }
                return instance; 
            }

        }
        public IEnumerable<Order> GetOrderList()
        {
            List<Order> Orders;
            try
            {
                var myStockDB = new FSTOREContext();
                Orders = myStockDB.Orders.ToList();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Orders;
        }
        public IEnumerable<Report> Report(DateTime start, DateTime end)
        {
            var myStockDB = new FSTOREContext();
            return myStockDB.Orders.Include(e => e.OrderDetails).Where(e => e.OrderDate >= start && e.OrderDate <= end).Select(e => new Report
            {
                OrderId = e.OrderId,
                MemberId = e.MemberId,
                OrderDate   = e.OrderDate,
                TotalMoney = e.OrderDetails.Sum(d => d.UnitPrice * Convert.ToDecimal(d.Quantity) * (100 - Convert.ToDecimal(d.Discount)) / 100)
            }).OrderByDescending(e => e.TotalMoney).ToList();
        }
        public Order GetOrderById(int OrderId)
        {
            Order Order = null;
            try
            {
                var myStockDB = new FSTOREContext();
                Order = myStockDB.Orders.SingleOrDefault(Order => Order.OrderId == OrderId);

            }
            catch (Exception ex) { throw new Exception(ex.Message); }
            return Order;
        }
        public Member GetMemberByEmail(String email)
        {
            Member Member = null;
            try
            {
                var myStockDB = new FSTOREContext();
                Member = myStockDB.Members.SingleOrDefault(Member => Member.Email == email);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Member;
        }
        public void AddNew(Order Order)
        {
            try
            {
                Order _Order = GetOrderById(Order.OrderId);
                if (_Order == null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Orders.Add(Order);
                    myStockDb.SaveChanges();
                }
                else
                {
                    throw new Exception("The Order is already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public void Update(Order Order)
        {
            try
            {
                Order c = GetOrderById(Order.OrderId);
                if (c != null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Entry<Order>(Order).State = EntityState.Modified;
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Order does not already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(Order Order)
        {
            try
            {
                Order c = GetOrderById(Order.OrderId);
                if (c != null)
                {
                    var myStockDb = new FSTOREContext();
                    myStockDb.Orders.Remove(Order);
                    myStockDb.SaveChanges();
                }
                else
                { throw new Exception("The Order does not already exist"); }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IEnumerable<Order> GetOrderByMember(int id)
        {
            List<Order> Orders;
            try
            {
                var myStockDB = new FSTOREContext();
                Orders = myStockDB.Orders.Where(e => e.MemberId == id).ToList();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Orders;
        }
    }
}
