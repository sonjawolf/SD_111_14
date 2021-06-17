using SonjaAsp.Application.Email;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace SonjaAsp.Implemantation.Email
{
    public class SmtpEmailSender : IEmailSender
    {
     
        public void Send(SendEmailDto dto)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("sonja.111.14@gmail.com", "sifra123456!")
            };

            var message = new MailMessage("sonja.111.14@gmail.com", dto.SendTo);
            message.Subject = dto.Subject;
            message.Body = dto.Content;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
