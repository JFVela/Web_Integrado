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
		
		String miCuenta="renovandovidas.ong@gmail.com";
		String contraseña="hazuhttuuyzxtlkd";
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
			message.setSubject("Código de Verificación para Donación");
			String htmlcode="<section style=\"background-color: #7ca1b1;align-items: center;color: white;padding: 5px;;\">\r\n"
					+ "        <div style=\"text-align: center; font-size: 18px;\">\r\n"
					+ "            <p style=\"color: white;\">Gracias por tu interés en apoyar nuestra causa. Hemos generado un código de verificación exclusivo para que\r\n"
					+ "                puedas completar tu donación. A continuación, encontrarás el código que necesitas:</p>\r\n"
					+ "           <h1 style=\"color: white;\">Código de Verificación: "+mensaje+"</h1>\r\n"
					+ "           <img src=\"https://live.staticflickr.com/65535/53309313117_b757d25132_c.jpg\" width=\"300\"\r\n"
					+ "             height=\"300\" alt=\"Quiero-donar-foto-lateral-Dona\"/>\r\n"
					+ "        </div>        \r\n"
					+ "        <div style=\"font-size: 18px;color: white;\">\r\n"
					+ "            <p>Gracias por tu generosidad y por ser parte de nuestro esfuerzo. Tu donación hará una diferencia real en nuestras causas.</p>\r\n"
					+ "\r\n"
					+ "            <p>Atentamente,<br>\r\n"
					+ "                Equipo de Desarrollo<br>\r\n"
					+ "                Renovando Vidas<br>\r\n"
					+ "            </p>\r\n"
					+ "        </div>\r\n"
					+ "    </section>";
			message.setContent(htmlcode,"text/html");
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
