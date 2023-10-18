package ong.controlador;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import ong.entity.Inscripcion;
import ong.entity.Voluntario;
import ong.dao.MySqlVoluntarioDAO;
import ong.dao.MySqlnscripcionDAO;
/**
 * Servlet implementation class ServletVoluntario
 */
@WebServlet("/ServletVoluntario")
public class ServletVoluntario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletVoluntario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //recuperar el parametro accion
	    String tipo = request.getParameter("accion");
	    //validar tipo
	    if (tipo.equals("guardar")) {
	        grabarVoluntario(request, response);
	    } else if (tipo.equals("verificarDNI")) {
	        verificarDNI(request, response);
	    } else if (tipo.equals("verificarCorreo")) {
	        verificarCorreo(request, response);
	    }else if(tipo.equals("listado"))
			listarVoluntario(request,response);
		else if(tipo.equals("eliminar"))
			eliminarVoluntario(request,response);	
	}


	

	private void verificarCorreo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 // Recuperar el email del formulario
	    String email = request.getParameter("email");

	    System.out.println("Verificando Correo: " + email); // Para verificar si se ejecuta esta parte

	    // Llama al método findById de tu DAO para buscar el DNI en la base de datos
	    MySqlVoluntarioDAO voluntarioDAO = new MySqlVoluntarioDAO(); 
	    Voluntario voluntario = voluntarioDAO.findCorreo(email);

	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();

	    if (voluntario != null) {
	        // Si el voluntario existe, agrega una propiedad al objeto JSON
	        jsonObject.addProperty("status", "correo_existente");
	        System.out.println("Correo existente en la base de datos.");
	    } else {
	        System.out.println("Correo no encontrado en la base de datos.");
	    }

	    // Convierte el objeto JSON a una cadena JSON
	    String jsonString = gson.toJson(jsonObject);

	    // Configura la respuesta HTTP
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // Escribe la cadena JSON en la respuesta
	    response.getWriter().write(jsonString);
	}

	private void eliminarVoluntario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dni=request.getParameter("dni");
		//invocar al método deleteById y enviar la variable "cod"
		int estado=new MySqlVoluntarioDAO().deleteById(Integer.parseInt(dni));
		//validar estado
		if(estado==1)
			System.out.println("SI");
		else
			System.out.println("NO");
		//crear atributo de tipo sesión
		request.getSession().setAttribute("MENSAJE","Voluntario eliminado");
		//invocar método listarDocente
		//listarDocente(request,response);
		response.sendRedirect("AdVoluntarios.jsp");		
	}

	private void listarVoluntario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//crear atributo
		request.setAttribute("docentes",new MySqlVoluntarioDAO().findAll());
		//direccionar a la página "docente.jsp"
		request.getRequestDispatcher("/AdVoluntarios.jsp").forward(request,response);		
	}

	private void verificarDNI(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 // Recuperar el DNI del formulario
	    String dni = request.getParameter("dni");

	    System.out.println("Verificando DNI: " + dni); // Para verificar si se ejecuta esta parte

	    // Llama al método findById de tu DAO para buscar el DNI en la base de datos
	    MySqlVoluntarioDAO voluntarioDAO = new MySqlVoluntarioDAO(); 
	    Voluntario voluntario = voluntarioDAO.findDNI(Integer.parseInt(dni));

	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();

	    if (voluntario != null) {
	        // Si el voluntario existe, agrega una propiedad al objeto JSON
	        jsonObject.addProperty("status", "dni_existente");
	        System.out.println("DNI existente en la base de datos.");
	    } else {
	        System.out.println("DNI no encontrado en la base de datos.");
	    }

	    // Convierte el objeto JSON a una cadena JSON
	    String jsonString = gson.toJson(jsonObject);

	    // Configura la respuesta HTTP
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // Escribe la cadena JSON en la respuesta
	    response.getWriter().write(jsonString);
	
	}

	private void grabarVoluntario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 // Recuperar los valores de los controles del formulario
	    String nom, pat, mat, dni, email, tel, espec, ciud, prov, dist, evento;
	    nom = request.getParameter("nombre");
	    pat = request.getParameter("paterno");
	    mat = request.getParameter("materno");
	    dni = request.getParameter("dni");
	    email = request.getParameter("email");
	    tel = request.getParameter("telefono");
	    espec = request.getParameter("especialidad");
	    ciud = request.getParameter("ciudad");
	    prov = request.getParameter("provincia");
	    dist = request.getParameter("distrito");
	    evento = request.getParameter("evento");
		
	    // Crear un objeto de la clase Voluntario
	    Voluntario voluntario = new Voluntario();
	    voluntario.setNombre(nom);
	    voluntario.setPaterno(pat);
	    voluntario.setMaterno(mat);
	    voluntario.setDni(Integer.parseInt(dni));
	    voluntario.setEmail(email);
	    voluntario.setTelefono(Integer.parseInt(tel));
	    voluntario.setEspecialidad(Integer.parseInt(espec));
	    voluntario.setCiudad(ciud);
	    voluntario.setProvincia(prov);
	    voluntario.setDistrito(dist);

	    // Crear un objeto de la clase Inscripcion
	    Inscripcion inscripcion = new Inscripcion();
	    inscripcion.setVoluntario_dni(Integer.parseInt(dni));
	    inscripcion.setEventos_id_evento(Integer.parseInt(evento)); // Reemplaza 1 con el valor correcto de id_evento

	    // Llamar al método saveVoluntarioEInscripcion en el DAO
	    int estado = new MySqlVoluntarioDAO().save(voluntario, inscripcion);

		System.out.println(dni+" "+nom+" "+pat+" "+dist);
		// 5. Validar el estado y mostrar el mensaje de SweetAlert
		// Procesa los datos del formulario y guarda el mensaje en el ámbito de solicitud
		String mensaje = ""; // Inicializa el mensaje
		String correoCodificado = URLEncoder.encode(email, StandardCharsets.UTF_8.toString());
		String paginaDestino = "voluntariadoenviado.jsp?q=" + correoCodificado; // Crear la URL de destino
		if (estado == 1) {
		    mensaje = "Los datos se guardaron correctamente.";
		    // Obtener la sesión o crear una nueva
		    HttpSession session = request.getSession(true);
		    // Establecer un atributo de sesión para marcar al usuario como autenticado
		    session.setAttribute("voluntario", true);
		 // Redirige a la página JSP deseada
			response.sendRedirect(paginaDestino);
		} else {
		    mensaje = "Hubo un problema al guardar los datos.";
		}
		
		// Guarda el mensaje en el ámbito de solicitud
		request.setAttribute("mensaje", mensaje);
	}
	
	

	

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doHead(HttpServletRequest, HttpServletResponse)
	 */
	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doOptions(HttpServletRequest, HttpServletResponse)
	 */
	protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doTrace(HttpServletRequest, HttpServletResponse)
	 */
	protected void doTrace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
