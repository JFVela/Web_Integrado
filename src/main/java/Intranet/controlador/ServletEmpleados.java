package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Intranet.dao.MySQL_Empleados;
import Intranet.entidad.Empleados;
import Intranet.entidad.Enlace;

@WebServlet("/ServletEmpleados")
public class ServletEmpleados<Enlace> extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletEmpleados() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String tipo = request.getParameter("accion");

		if (tipo != null) {
			if (tipo.equals("INICIAR"))
				iniciarSesion(request, response);
			else if (tipo.equals("CERRAR"))
				cerrarSesion(request, response);
			else if (tipo.equals("grabar"))
				GuardarEmpleado(request, response);
			else if (tipo.equals("listado"))
				ListarEmpleados(request, response);
			else if (tipo.equals("eliminar"))
				EliminarEmpleado(request, response);
			else if (tipo.equals("verificarDNI"))
				DNI(request, response);
			else if (tipo.equals("verificarLogin"))
				login(request, response);
			else if (tipo.equals("verificarTelefono"))
				telefono(request, response);
			else if (tipo.equals("verificarCorreo"))
				correo(request, response);
			else if (tipo.equals("listarRol"))
				listarRol(request, response);

			else if (tipo.equals("listarDepartamento"))
				listaDepa(request, response);

		}
	}

	private void listaDepa(HttpServletRequest request, HttpServletResponse response) {
		try {
			// Crear un cliente HTTP
			HttpClient client = HttpClient.newHttpClient();

			// Crear una solicitud HTTP GET con la URI especificada
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/Depa/lista"))
					.GET().build();

			// Enviar la solicitud y obtener la respuesta
			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			// Obtener la respuesta del servidor y enviarla al cliente
			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void listarRol(HttpServletRequest request, HttpServletResponse response) {
		try {
			// Crear un cliente HTTP
			HttpClient client = HttpClient.newHttpClient();

			// Crear una solicitud HTTP GET con la URI especificada
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/Roles/lista"))
					.GET().build();

			// Enviar la solicitud y obtener la respuesta
			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			// Obtener la respuesta del servidor y enviarla al cliente
			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void correo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String correo = request.getParameter("correo");
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		try {
			MySQL_Empleados sql = new MySQL_Empleados();
			Empleados empre = sql.findCorreo(correo);

			if (empre != null) {
				jsonObject.addProperty("status", "correo_existente");
				jsonObject.addProperty("message", "Correo existente en la base de datos.");
			} else {
				jsonObject.addProperty("status", "correo_no_existente");
				jsonObject.addProperty("message", "Correo no encontrado en la base de datos.");
			}
		} catch (Exception e) {
			jsonObject.addProperty("status", "error");
			jsonObject.addProperty("message", "Error al procesar la solicitud.");
			e.printStackTrace();
		}

		String jsonString = gson.toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
	}

	private void telefono(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String telefonoStr = request.getParameter("telefono");
		System.out.println("Verificando Teléfono: " + telefonoStr);

		int telefono = -1;
		try {
			telefono = Integer.parseInt(telefonoStr);
		} catch (NumberFormatException e) {
			System.out.println("Número de teléfono no válido.");
		}

		MySQL_Empleados sql = new MySQL_Empleados();
		Empleados empre = sql.findTelefono(telefono);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (empre != null) {
			jsonObject.addProperty("status", "telefono_existente");
			System.out.println("Número de teléfono existente en la base de datos.");
		} else {
			System.out.println("Número de teléfono no encontrado en la base de datos.");
		}

		String jsonString = gson.toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String login = request.getParameter("login");
		System.out.println("Verificando Login: " + login);

		MySQL_Empleados sql = new MySQL_Empleados();
		Empleados empre = sql.findLogin(login);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (empre != null) {
			jsonObject.addProperty("status", "login_existente");
			System.out.println("Nombre de usuario existente en la base de datos.");
		} else {
			System.out.println("Nombre de usuario no encontrado en la base de datos.");
		}

		String jsonString = gson.toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
	}

	private void DNI(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dniStr = request.getParameter("dni");
		System.out.println("Verificando DNI: " + dniStr);

		int dni = -1;
		try {
			dni = Integer.parseInt(dniStr);
		} catch (NumberFormatException e) {
			System.out.println("Número de DNI no válido.");
		}

		MySQL_Empleados sql = new MySQL_Empleados();
		Empleados empre = sql.findDNI(dni);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (empre != null) {
			jsonObject.addProperty("status", "dni_existente");
			System.out.println("Número de DNI existente en la base de datos.");
		} else {
			System.out.println("Número de DNI no encontrado en la base de datos.");
		}

		String jsonString = gson.toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonString);
	}

	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.getSession().setAttribute("CERRAR", "SESSION CERRADA");
		response.sendRedirect("Login.jsp");
	}

	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String vLogin, vClave;
		vLogin = request.getParameter("login");
		vClave = request.getParameter("contrasena");

		// Validar si los campos de usuario y contraseña están vacíos
		if (vLogin == null || vClave == null) {
			request.getSession().setAttribute("INVALIDO", "Ingresar sesión");
			response.sendRedirect("Login.jsp?showMessage=true");
			return;
		}

		// Obtener el usuario por su nombre de usuario (login)
		Empleados empleado = new MySQL_Empleados().iniciarSesion(vLogin);

		if (empleado == null) {
			request.getSession().setAttribute("INVALIDO", "Usuario o Contraseña incorrecta");
			response.sendRedirect("Login.jsp?showMessage=true");
			return;
		}

		// Generar el hash de la contraseña ingresada
		String hashIngresado = hashPassword(vClave, empleado.getSalt());

		// Comparar los hashes
		if (hashIngresado.equals(empleado.getContraseña())) {
			// Las contraseñas coinciden, el inicio de sesión es exitoso
			List<Intranet.entidad.Enlace> lista = new MySQL_Empleados().traerEnlaceDelUsuario(empleado.getId_rol());
			HttpSession session = request.getSession();
			session.setAttribute("listaEnlaces", lista);
			session.setAttribute("datosEmpleado", empleado.getLogin());
			response.sendRedirect("intranet.jsp");
			request.getSession().setAttribute("INICIO", "BIENVENIDO");
		} else {
			// Las contraseñas no coinciden, inicio de sesión fallido
			request.getSession().setAttribute("INVALIDO", "Usuario o Contraseña incorrecta");
			response.sendRedirect("Login.jsp?showMessage=true");
		}
	}

	private void EliminarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String codigo = request.getParameter("codigo");
		int estado = new MySQL_Empleados().deleteCod(Integer.parseInt(codigo));
		String tipoMensaje = "";

		if (estado == 1) {
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Empleado eliminado con éxito");
			response.sendRedirect("Empleados.jsp");
		} else {
			// Mostrar mensaje de error utilizando Toastr
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Empleado");
			response.sendRedirect("Empleados.jsp");
		}
	}

	
	/*
	 * AL COMIENZO USAMOS ESTO PARA LISTAR
	private void ListarEmpleados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("empleados", new MySQL_Empleados().findAll());
		request.getRequestDispatcher("/Empleados.jsp").forward(request, response);
	}*/
	
	private void ListarEmpleados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Crear un cliente HTTP
			HttpClient client = HttpClient.newHttpClient();

			// Crear una solicitud HTTP GET con la URI especificada
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/Empleado/lista"))
					.GET().build();

			// Enviar la solicitud y obtener la respuesta
			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			// Obtener la respuesta del servidor y enviarla al cliente
			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void GuardarEmpleado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtener datos del formulario
		String dni, codigo, login, contraseña, nombre, paterno, materno, telefono, correo, direccion, sueldo, id_rol,
				id_depa;
		dni = request.getParameter("dni");
		codigo = request.getParameter("codigo");
		login = request.getParameter("login");
		contraseña = request.getParameter("contrasena"); // La contraseña en texto plano
		nombre = request.getParameter("nombre");
		paterno = request.getParameter("paterno");
		materno = request.getParameter("materno");
		telefono = request.getParameter("telefono");
		correo = request.getParameter("correo");
		direccion = request.getParameter("direccion");
		sueldo = request.getParameter("sueldo");
		id_rol = request.getParameter("rol");
		id_depa = request.getParameter("departamento");
		String tipoMensaje = "error";

		// Generar una sal (salt) aleatoria para la contraseña
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[16];
		random.nextBytes(salt);

		// Encriptar la contraseña con sal
		String contraseñaEncriptada = hashPassword(contraseña, salt);

		Empleados empleado = new Empleados();
		empleado.setDni(Integer.parseInt(dni));
		empleado.setCodigo(Integer.parseInt(codigo));
		empleado.setLogin(login);
		empleado.setContraseña(contraseñaEncriptada); // Guardar la contraseña encriptada
		empleado.setSalt(salt); // Guardar el salt
		empleado.setNombre(nombre);
		empleado.setPaterno(paterno);
		empleado.setMaterno(materno);
		empleado.setTelefono(Integer.parseInt(telefono));
		empleado.setCorreo(correo);
		empleado.setDireccion(direccion);
		empleado.setSueldo(Double.parseDouble(sueldo));
		empleado.setId_rol(Integer.parseInt(id_rol));
		empleado.setId_depa(Integer.parseInt(id_depa));

		if (empleado.getCodigo() == 0) {
			int estado = new MySQL_Empleados().save(empleado);
			if (estado == 1) {
				tipoMensaje = "success";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Empleado registrado");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Error en el registro");
			}
		} else {
			// Implementa la actualización del empleado aquí
			int estado = new MySQL_Empleados().update(empleado);
			if (estado == 1) {
				tipoMensaje = "warning";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Empleado actualizado");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Error en la actualización");
			}
		}
		response.sendRedirect("Empleados.jsp");
	}

	private String hashPassword(String password, byte[] salt) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt);
			byte[] hashedPassword = md.digest(password.getBytes());
			StringBuilder sb = new StringBuilder();
			for (byte b : hashedPassword) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			// Maneja la excepción apropiadamente
			e.printStackTrace();
			return null;
		}
	}

	private boolean usuarioHaIniciadoSesion(HttpServletRequest request) {
		HttpSession session = request.getSession(false); // Obtenemos la sesión actual, si existe

		if (session != null && session.getAttribute("datosEmpleado") != null) {
			// El usuario ha iniciado sesión si el atributo "datosEmpleado" existe en la
			// sesión
			return true;
		} else {
			return false;
		}
	}
}
