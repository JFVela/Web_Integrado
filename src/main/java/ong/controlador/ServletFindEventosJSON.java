package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlEventosDAO;
import ong.entity.Eventos;


/**
 * Servlet implementation class ServletFindEventos
 */
@WebServlet("/ServletFindEventosJSON")
public class ServletFindEventosJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletFindEventosJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//recuperar parámetro codigo
		String id=request.getParameter("id");
		Eventos bean=new MySqlEventosDAO().findById(Integer.parseInt(id));
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.print(json);	
						
	}

}
