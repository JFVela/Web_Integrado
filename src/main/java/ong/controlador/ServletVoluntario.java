package ong.controlador;

import java.io.IOException;

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
	        grabarInscripcion(request, response);
	    } else if (tipo.equals("verificarDNI")) {
	        verificarDNI(request, response);
	    }
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

		//1. recuperar los valores de los controles (cajas) del form
		//usar atributo name.
		String nom,pat,mat,dni, email,tel,espec,ciud,prov,dist;
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
		//2.Crear objeto de la clase Voluntario
		Voluntario bean = new Voluntario();
		//3.Setear los atributos del objeto "bean" con las variables
		bean.setNombre(nom);
		bean.setPaterno(pat);
		bean.setMaterno(mat);
		bean.setDni(Integer.parseInt(dni));
		bean.setEmail(email);
		bean.setTelefono(Integer.parseInt(tel));
	

	    bean.setEspecialidad(Integer.parseInt(espec)); // Asignar el valor numérico a la especialidad

		bean.setCiudad(ciud);
		bean.setProvincia(prov);
		bean.setDistrito(dist);
		//4. Invocar al metodo save y enviar el objeto "bean"
		int estado = new MySqlVoluntarioDAO().save(bean);
		// 5. Validar el estado y mostrar el mensaje de SweetAlert
		// Procesa los datos del formulario y guarda el mensaje en el ámbito de solicitud
		String mensaje = ""; // Inicializa el mensaje
		String paginaDestino = "voluntariadoenviado.jsp?q=" + email; // Crear la URL de destino
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
	
	private void grabarInscripcion(HttpServletRequest request, HttpServletResponse response) {
		//1. recuperar los valores de los controles (cajas) del form
		//usar atributo name.
		String dni, evento;
				
		dni = request.getParameter("dni");
		evento = request.getParameter("evento");
				
		//2.Crear objeto de la clase Voluntario
		Inscripcion inscripcion = new Inscripcion();
			
		
	    
		inscripcion.setVoluntario_dni(Integer.parseInt(dni));
	    inscripcion.setEventos_id_evento(Integer.parseInt(evento)); // Asignar el valor numérico a id_evento
				
		//4. Invocar al metodo save y enviar el objeto "bean"
		int estado = new MySqlnscripcionDAO().save(inscripcion);
		
		//validar estado
		if (estado == 1) {
			System.out.println("Si");
		} else {
			System.out.println("NO");
		}
		
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
