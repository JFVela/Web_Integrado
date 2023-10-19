package ong.interfaces;

import java.util.List;

import ong.entity.Especialidad;

public interface EspecialidadesDAO {
	
	//método que registra una Especialidad y retorna un entero
		int save(Especialidad bean);
		//método que actualiza una ESPECIALIDAD y retorna un entero
		int update(Especialidad bean);
		//método deleteById que elimina una ESPECIALIDAD según su código  y retorna un entero
		int deleteById(int cod);
		//método findById busca código de un VOLUNATARIO y retorna un objeto VOLUNTARIO
		Especialidad findById(int cod);
		//Lista ESpecialidades
	public List<Especialidad> findAll();
	int deleteWithVolunteers(int id);

}
