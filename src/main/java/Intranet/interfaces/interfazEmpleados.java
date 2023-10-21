package Intranet.interfaces;

import java.util.List;
import Intranet.entidad.Empleados;
import Intranet.entidad.Enlace;

public interface interfazEmpleados {
	Empleados iniciarSesion(String login);
	
	int save(Empleados empleado);

	int update(Empleados empleado);

	int deleteCod(int codigo);

	Empleados findByCod(int codigo);

	List<Empleados> findAll();
	List<Enlace> traerEnlaceDelUsuario(int codRol);
}
