using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using DataAccess.Repository;
using Microsoft.Extensions.DependencyInjection;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private ServiceProvider serviceProvider;
        public App()
        {
            //config for DependencyInjection
            ServiceCollection services = new ServiceCollection();
            ConfigureService(services);
            serviceProvider = services.BuildServiceProvider();
        }

        private void ConfigureService(ServiceCollection services)
        {
            services.AddScoped(typeof(IMemberRepository), typeof(MemberRepository));
            services.AddScoped(typeof(IProductRepository), typeof(ProductRepository));
            services.AddScoped(typeof(IOrderRepository), typeof(OrderRepository));
            services.AddTransient<Login>();
        }

        private void OnStartUp(object sender, StartupEventArgs e)
        {
            var login = serviceProvider.GetService<Login>();
            login.Show();
        }
    }
}
