package Intranet.controlador;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	}

	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.getSession().setAttribute("MENSAJE", "Sesión terminada");
		response.sendRedirect("Login.jsp");
	}

	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String vLogin, vClave;
		vLogin = request.getParameter("login");
		vClave = request.getParameter("contrasena");

		Empleados empleado = new MySQL_Empleados().iniciarSesion(vLogin, vClave);

		if (empleado == null) {
			request.getSession().setAttribute("MENSAJE", "Usuario y/o contraseña incorrectos");
			response.sendRedirect("Login.jsp");
		} else {
			List<Intranet.entidad.Enlace> lista =new MySQL_Empleados().traerEnlaceDelUsuario(empleado.getId_rol());
			HttpSession session = request.getSession();
			session.setAttribute("listaEnlaces", lista);
			session.setAttribute("datosEmpleado", empleado.getLogin());
			response.sendRedirect("intranet.jsp");
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

	private void ListarEmpleados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("empleados", new MySQL_Empleados().findAll());
		request.getRequestDispatcher("/Empleados.jsp").forward(request, response);
	}

	private void GuardarEmpleado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dni, codigo, login, contraseña, nombre, paterno, materno, telefono, correo, direccion, sueldo, id_rol,
				id_depa;
		dni = request.getParameter("dni");
		codigo = request.getParameter("codigo");
		login = request.getParameter("login");
		contraseña = request.getParameter("contrasena");
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

		Empleados empleado = new Empleados();
		empleado.setDni(Integer.parseInt(dni));
		empleado.setCodigo(Integer.parseInt(codigo));
		empleado.setLogin(login);
		empleado.setContraseña(contraseña);
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
}
