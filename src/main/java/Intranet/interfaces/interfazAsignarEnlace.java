package Intranet.interfaces;

import java.util.List;
import Intranet.entidad.Asignar_Enlace;

public interface interfazAsignarEnlace {
	List<Asignar_Enlace> findAll();

	int saveAsignaciones(List<Asignar_Enlace> asignaciones);

	void deleteAsignacion(int idRol, int idEnlace);
}
