/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jamaGmail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author Lama
 */
public class JavaGmail {

    
    
    public void sendMail(String futsalMail, String fname, String Usermessage) {
        
        String fmail = futsalMail;
//        System.out.print(fmail);
        
        final String username = "nepalfutsal665@gmail.com";
		final String password = "nepalfutsal2052";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
                try {
                        
                        
                        Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("scarecrow281@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(futsalMail));
			message.setSubject("Booking information");
			message.setText(Usermessage);

			Transport.send(message);

			System.out.println("Done");
        } catch (Exception e) {
            
            throw new RuntimeException(e);
            
        }

    
    }
    
}
