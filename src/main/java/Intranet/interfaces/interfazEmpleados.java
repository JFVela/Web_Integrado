package Intranet.interfaces;

import java.util.List;
import Intranet.entidad.Empleados;

public interface interfazEmpleados {
	int save(Empleados empleado);

	int update(Empleados empleado);

	int deleteDNI(int dni);

	Empleados findByDNI(int dni);

	List<Empleados> findAll();
}
