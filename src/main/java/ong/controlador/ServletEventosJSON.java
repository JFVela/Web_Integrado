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

import ong.dao.MySqlEventosDAO;
import ong.entity.Eventos;

/**
 * Servlet implementation class ServletEventosJSON
 */
@WebServlet("/ServletEventosJSON")
public class ServletEventosJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEventosJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//obtener lista de todos los colegios
		List<Eventos> lista = new MySqlEventosDAO().findAll();
		//Crear objeto de la clase GSON
		Gson gson = new Gson();
		//convertir a JSON(STRING) el arreglo lista
		String json = gson.toJson(lista);
		//Preparar salida en format JSON
		response.setContentType("application/json;charset=UTF-8");
		//
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

}
