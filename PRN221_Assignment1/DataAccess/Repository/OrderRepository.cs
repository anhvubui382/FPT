using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class OrderRepository : IOrderRepository
    {
        public void DeleteOrder(Order Order)
        => OrderDAO.Instance.Remove(Order);

        public Order GetOrderById(int OrderId)
        => OrderDAO.Instance.GetOrderById(OrderId);

        public IEnumerable<Order> GetOrderByMember(int id)
        => OrderDAO.Instance.GetOrderByMember(id);

        public IEnumerable<Order> GetOrders()
        => OrderDAO.Instance.GetOrderList();

        public void InsertOrder(Order Order)
        => OrderDAO.Instance.AddNew(Order);

        public IEnumerable<Report> Report(DateTime start, DateTime end)
        => OrderDAO.Instance.Report(start,end);

        public void UpdateOrder(Order Order)
        => OrderDAO.Instance.Update(Order);
        public int getIdJustCreate()
        {
            Order order = new Order();
            try
            {
                var context = new FSTOREContext();
                order = context.Orders.OrderByDescending(o => o.OrderId).FirstOrDefault();

            }catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return order.OrderId;
        }
    }
}
