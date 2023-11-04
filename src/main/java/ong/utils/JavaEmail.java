package ong.utils;
import java.security.SecureRandom;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;

public class JavaEmail {
	public static void enviarMail(String receptor,String mensaje) throws Exception {
		System.out.print("Preparando el envio");
		Properties pr=new Properties();
		pr.put("mail.smtp.auth", true);
		pr.put("mail.smtp.starttls.enable", true);
		pr.put("mail.smtp.host", "smtp.gmail.com");
		pr.put("mail.smtp.port", "587");
		
		String miCuenta="diego.bautistamlp@gmail.com";
		String contraseña="ccc";
		Session session=Session.getInstance(pr,new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(miCuenta,contraseña);
			}
		});
		Message ms=prepareMessage(session,miCuenta,receptor,mensaje);
		Transport.send(ms);
		System.out.print("Mensaje enviado con exito");
	}

	private static Message prepareMessage(Session session, String miCuenta, String receptor, String mensaje) {
		try {
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(miCuenta));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(receptor));
			message.setSubject("dede");
			message.setText(mensaje);
			return message;
		}catch(Exception ex) {
			Logger.getLogger(JavaEmail.class.getName()).log(Level.SEVERE,null,ex);
		}
		return null;
	}
	
	//GENERAR CODIGO DE 8 CARACTERES 
	 private static final String CHARACTERS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	    private static final int CODE_LENGTH = 8;

	    public static String GenerarCodigo() {
	        SecureRandom random = new SecureRandom();
	        StringBuilder code = new StringBuilder(CODE_LENGTH);

	        for (int i = 0; i < CODE_LENGTH; i++) {
	            int randomIndex = random.nextInt(CHARACTERS.length());
	            char randomChar = CHARACTERS.charAt(randomIndex);
	            code.append(randomChar);
	        }

	        return code.toString().toUpperCase();
	    }

}
