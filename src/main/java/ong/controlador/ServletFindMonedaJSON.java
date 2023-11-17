package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlMonedaDAO;
import ong.entity.Moneda;

@WebServlet("/ServletFindMonedaJSON")
public class ServletFindMonedaJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletFindMonedaJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod=request.getParameter("codigo");
		Moneda bean = new  MySqlMonedaDAO().findById(Integer.parseInt(cod));
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.print(json);	
	}

}
