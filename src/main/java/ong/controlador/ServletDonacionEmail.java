package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.utils.JavaEmail;

@WebServlet("/ServletDonacionEmail")
public class ServletDonacionEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletDonacionEmail() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receptor=request.getParameter("correo-receptor");
		try {
			//podría utilizar jwt
			JavaEmail.enviarMail(receptor,"De");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
