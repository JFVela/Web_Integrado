package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Intranet.dao.MySQL_Enlace;
import Intranet.entidad.Enlace;

// Importa las clases necesarias

@WebServlet("/ServletEnlaceJSON")
public class ServletEnlaceJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletEnlaceJSON() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtiene el ID del rol seleccionado desde la interfaz
		String idRolSeleccionado = request.getParameter("idRolSeleccionado");

		// Realiza la consulta con el nuevo método
		List<Enlace> lista = new MySQL_Enlace().findAll(idRolSeleccionado);

		// Convierte la lista a JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		// Configura la respuesta
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}
}
