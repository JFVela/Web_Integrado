package Intranet.interfaces;

import java.util.List;
import Intranet.entidad.Empleados;

public interface interfazEmpleados {
	int save(Empleados empleado);

	int update(Empleados empleado);

	int deleteCod(int codigo);

	Empleados findByCod(int codigo);

	List<Empleados> findAll();
}