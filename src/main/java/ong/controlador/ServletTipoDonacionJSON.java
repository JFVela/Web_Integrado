package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlTipoDonacionDAO;
import ong.entity.Tipo_Donacion;

@WebServlet("/ServletTipoDonacionJSON")
public class ServletTipoDonacionJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ServletTipoDonacionJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<Tipo_Donacion> lista=new MySqlTipoDonacionDAO().findAll();
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.print(json);	
	}

}
