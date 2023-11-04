package Intranet.interfaces;

import java.util.List;

import Intranet.entidad.Detalle_Rol_Enlace;
import Intranet.entidad.Rol_Enlace;

public interface interfazRol_Enlace {

	List<Rol_Enlace> findAll();

	int saveRol_Enlace(Rol_Enlace bean, List<Detalle_Rol_Enlace> lista);

}
