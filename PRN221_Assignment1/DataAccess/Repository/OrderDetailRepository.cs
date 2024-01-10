using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class OrderDetailRepository : IOrderDetailRepository
    {
        public void deleteOrderDetail(OrderDetail orderDetail)
        {
            var context = new FSTOREContext();
            context.OrderDetails.Remove(orderDetail);
            context.SaveChanges();
        }

        public IEnumerable<OrderDetail> getAllOrdersDetails()
        {
            throw new NotImplementedException();
        }

        public OrderDetail GetOrderDetailById(int orderId)
        {
            var context = new FSTOREContext();
            return context.OrderDetails.SingleOrDefault(o => o.OrderId == orderId);
        }

        public void insertOrderDetail(OrderDetail orderDetail)
        {
            var context = new FSTOREContext();
            context.OrderDetails.Add(orderDetail);
            context.SaveChanges();
        }

        public void updateOrderDetail(OrderDetail orderDetail)
        {
            var context = new FSTOREContext();
            context.OrderDetails.Update(orderDetail);
            context.SaveChanges();
        }
    }
}
