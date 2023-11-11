package Intranet.interfaces;

import java.util.List;

import Intranet.entidad.Enlace;

public interface interfazEnlace {
	List<Enlace> findAll(String rol_selecionado);
}
