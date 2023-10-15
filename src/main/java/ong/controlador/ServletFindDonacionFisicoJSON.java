package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlDonacionFiscaDAO;
import ong.dao.MySqlLocacionDAO;
import ong.entity.DonacionFisica;
import ong.entity.Locacion;

@WebServlet("/ServletFindDonacionFisicoJSON")
public class ServletFindDonacionFisicoJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ServletFindDonacionFisicoJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		DonacionFisica bean=new MySqlDonacionFiscaDAO().findById(Integer.parseInt(id));
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.print(json);
	}

}
