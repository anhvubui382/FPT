﻿using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using System.Net;

namespace WebRazor.Helpers
{
	public class SendMailHelper : Controller
	{
        //send password
        public async static void SendMail(string email, string body)
        {

            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    UserName = "anhvubui382@gmail.com", 
                    Password = "bav02082002"
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                var message = new MailMessage();
                message.To.Add(email);
                message.Subject = "New password";
                message.Body = body;
                message.IsBodyHtml = true;
                message.From = new MailAddress("anhvubui382@gmail.com");
                await smtp.SendMailAsync(message);
            }
        }
        //send invoice
        public async static void SendMail(string email, string body, Dictionary<Stream, string> files)
        {
            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    UserName = "anhvubui382@gmail.com",
                    Password = "bav02082002"
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                var message = new MailMessage();
                message.To.Add(email);
                message.Subject = "Your invoice";
                message.Body = body;
                message.IsBodyHtml = true;
                message.From = new MailAddress("anhvubui382@gmail.com");
                try
                {
                    foreach (var file in files)
                    {
                        Console.WriteLine(file.Value);
                        message.Attachments.Add(new Attachment(file.Key, file.Value));
                    }
                    await smtp.SendMailAsync(message);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }

            }
        }
    }
}
