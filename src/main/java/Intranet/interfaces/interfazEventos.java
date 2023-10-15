package Intranet.interfaces;

import java.util.List;

import Intranet.entidad.Eventos;

public interface interfazEventos {

	int save(Eventos bean);

	int update(Eventos bean);

	int deleteById(int id_evento);

	Eventos findById(int id_evento);

	List<Eventos> findAll();

}
