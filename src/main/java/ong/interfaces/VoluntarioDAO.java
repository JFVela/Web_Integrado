package ong.interfaces;

import java.util.List;

import ong.entity.Inscripcion;
import ong.entity.Voluntario;

public interface VoluntarioDAO {

	//método que registra un VOLUNTARIO y retorna un entero
	int save(Voluntario voluntario, Inscripcion inscripcion);
	//método que actualiza un VOLUNTARIO y retorna un entero
	int update(Voluntario bean);
	//método deleteById que elimina un VOLUNTARIO según su código  y retorna un entero
	int deleteById(int cod);
	//método findById busca código de un VOLUNATARIO y retorna un objeto VOLUNTARIO
	Voluntario findById(int cod);
	//método findAll listar todos los docentes
	List<Voluntario> findAll();
	
	Voluntario findDNI(int cod);
	
	Voluntario findCorreo(String email);
	
	Voluntario findNumero(int num);
	
	int deleteByEventId(int cod);
	
	int deleteByEspecialidad(int especialidadId);

}
