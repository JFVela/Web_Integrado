package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlVoluntarioDAO;
import ong.entity.Voluntario;

/**
 * Servlet implementation class ServletFindVoluntario
 */
@WebServlet("/ServletFindVoluntarioJSON")
public class ServletFindVoluntarioJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletFindVoluntarioJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//recuperar parámetro dni
		String dni=request.getParameter("dni");
		Voluntario bean=new MySqlVoluntarioDAO().findById(Integer.parseInt(dni));
		Gson gson=new Gson();
		String json=gson.toJson(bean);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		pw.print(json);	
	}

}
