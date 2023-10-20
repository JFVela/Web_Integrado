package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Intranet.dao.MySQL_Empleados;
import Intranet.entidad.Empleados;

@WebServlet("/ServletEmpleados")
public class ServletEmpleados extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletEmpleados() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		if (tipo.equals("grabar"))
			GuardarEmpleado(request, response);
		else if (tipo.equals("listado"))
			ListarEmpleados(request, response);
		else if (tipo.equals("eliminar"))
			EliminarEmpleado(request, response);
	}

	private void EliminarEmpleado(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dni = request.getParameter("dni");
		int estado = new MySQL_Empleados().deleteDNI(Integer.parseInt(dni));
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
		String dni, login, contraseña, nombre, paterno, materno, telefono, correo, direccion, sueldo, id_rol, id_depa;
		dni = request.getParameter("dni");
		login = request.getParameter("login");
		contraseña = request.getParameter("contraseña");
		nombre = request.getParameter("nombre");
		paterno = request.getParameter("paterno");
		materno = request.getParameter("materno");
		telefono = request.getParameter("telefono");
		correo = request.getParameter("correo");
		direccion = request.getParameter("direccion");
		sueldo = request.getParameter("sueldo");
		id_rol = request.getParameter("id_rol");
		id_depa = request.getParameter("id_depa");
		String tipoMensaje = "error";

		Empleados empleado = new Empleados();
		empleado.setDni(Integer.parseInt(dni));
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

		if (empleado.getDni() == 0) {
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
