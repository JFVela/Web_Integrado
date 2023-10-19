package ong.interfaces;

import java.util.List;

import ong.entity.Eventos;

public interface EventosDAO {
	//método que registra un EVENTO y retorna un entero
		int save(Eventos bean);
		//método que actualiza un EVENTO y retorna un entero
		int update(Eventos bean);
		//método deleteById que elimina un EVENTOS según su código  y retorna un entero
		int deleteById(int cod);
		//método findById busca código de un EVENTOS y retorna un objeto VOLUNTARIO
		Eventos findById(int cod);
		//Lista EVENTOS
	public List<Eventos> findAll();

}
