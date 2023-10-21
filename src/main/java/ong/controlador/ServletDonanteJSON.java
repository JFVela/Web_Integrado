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

import ong.dao.MySqlDonanteDAO;
import ong.entity.Donante;

@WebServlet("/ServletDonanteJSON")
public class ServletDonanteJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletDonanteJSON() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				List<Donante> lista=new MySqlDonanteDAO().findAll();
				Gson gson=new Gson();
				String json=gson.toJson(lista);
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter pw=response.getWriter();
				pw.print(json);	
	}

}
