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

import ong.dao.MySqlEspecialidadesDAO;
import ong.entity.Especialidad;



/**
 * Servlet implementation class ServletEspecialidadesJSON
 */
@WebServlet("/ServletEspecialidadesJSON")
public class ServletEspecialidadesJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEspecialidadesJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//obtener lista de todos los colegios
		List<Especialidad> lista = new MySqlEspecialidadesDAO().findAll();
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
