package rtodao;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Emailercopy {

	public static void send(String from, String password, String to, String sub, String msg) {
System.out.print("send function catched");
System.out.println(from);
System.out.println(password);
System.out.println(to);
System.out.println(sub);
System.out.println(msg);
		
		 //Get properties object 
         Properties props = new Properties();
		  props.put("mail.smtp.host", "smtp.gmail.com");
		 props.put("mail.smtp.socketFactory.port", "465"); //465
		 props.put("mail.smtp.socketFactory.class",
		 "javax.net.ssl.SSLSocketFactory"); props.put("mail.smtp.auth",
		  "true"); props.put("mail.smtp.port", "465"); //465
		  props.put("mail.smtp.starttls.enable", "true"); //TLS //get Session
		  
		  
		  
		  
		  
		  
		 try{
		  
		  Session session = Session.getDefaultInstance(props, new
		  javax.mail.Authenticator() { protected PasswordAuthentication
		  getPasswordAuthentication() { return new
		  PasswordAuthentication(from,password); } }); //compose message try {
		  MimeMessage message = new MimeMessage(session);
		  message.addRecipient(Message.RecipientType.TO,new
		  InternetAddress(to)); message.setSubject(sub); message.setText(msg);
		  //send message
		  
		  Transport.send(message); System.out.println(
		  "message sent successfully");
		  
		  
		 
		  } catch (MessagingException e) {throw new RuntimeException(e);}
		  
		 
		
		
		//*******************************************************************************************


		/*Properties props = new Properties();
		props.put("mail.smtp.user","username"); 
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "25"); 
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.EnableSSL.enable","true");

		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		props.setProperty("mail.smtp.socketFactory.fallback", "false");   
		props.setProperty("mail.smtp.port", "587");   
		props.setProperty("mail.smtp.socketFactory.port", "587"); 

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject(sub);
			message.setText(msg);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}*/
 
    //Get properties object    
//    Properties props = new Properties();    
//    props.put("mail.smtp.host", "smtp.gmail.com");    
//    props.put("mail.smtp.socketFactory.port", "465");    
//    props.put("mail.smtp.socketFactory.class",    
//              "javax.net.ssl.SSLSocketFactory");    
//    props.put("mail.smtp.auth", "true");    
//    props.put("mail.smtp.port", "465");    
//    //get Session   
//    Session session = Session.getDefaultInstance(props,    
//     new javax.mail.Authenticator() {    
//     protected PasswordAuthentication getPasswordAuthentication() {    
//     return new PasswordAuthentication(from,password);  
//     }    
//    });    
//    //compose message    
//    try {    
//     MimeMessage message = new MimeMessage(session);
//     message.setFrom(new InternetAddress(from));
//     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
//     message.setSubject(sub);    
//     message.setText(msg);    
//     //send message  
//     Transport.send(message);    
//     System.out.println("message sent successfully");    
//    } catch (MessagingException e) {throw new RuntimeException(e);}    
//       
//}

	}
}

