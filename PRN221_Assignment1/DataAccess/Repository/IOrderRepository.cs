using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public interface IOrderRepository
    {
        IEnumerable<Order> GetOrders();
        IEnumerable<Order> GetOrderByMember(int id);
        Order GetOrderById(int OrderId);
        void InsertOrder(Order Order);
        void UpdateOrder(Order Order);
        void DeleteOrder(Order Order);
        IEnumerable<Report> Report(DateTime start, DateTime end);
    }
}
