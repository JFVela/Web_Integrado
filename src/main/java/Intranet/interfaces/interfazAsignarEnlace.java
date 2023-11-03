package Intranet.interfaces;

import java.util.List;
import Intranet.entidad.Asignar_Enlace;

public interface interfazAsignarEnlace {
    List<Asignar_Enlace> findAll();
    int saveAsignacion(Asignar_Enlace asignacion) throws Exception;

}
