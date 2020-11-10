/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

/**
 *
 * @author songm
 */
public class EmailUtility
{

    private static String port = "587";
    private static String username = "viettravel7@gmail.com";
    private static String password = "pkdjurafmkhyvvnv";

    public static void sendEmail(String recipent,
            String subject, String newPass) throws AddressException, MessagingException
    {
        Properties properties = new Properties();
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(properties, null);

        //create a new e-mail message
        Message msg = new MimeMessage(session);

        String content = "<h1>Change Password For VitR Account</h1><p>Your new password is: " + newPass + "</p>";  
        
        msg.setFrom(new InternetAddress(username));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipent));
        msg.setSubject(subject);
        msg.setContent(content, "text/html");

        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com", username, password);
        //send e-mail
        transport.sendMessage(msg, msg.getAllRecipients());
    }
}
