using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public interface IOrderDetailRepository
    {
        IEnumerable<OrderDetail> getAllOrdersDetails();
        OrderDetail GetOrderDetailById(int orderId);
        void insertOrderDetail (OrderDetail orderDetail);
        void deleteOrderDetail (OrderDetail orderDetail);
        void updateOrderDetail (OrderDetail orderDetail);
    }
}
