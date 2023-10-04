package ong.interfaces;

import java.util.List;

import ong.entity.Inscripcion;

public interface InscripcionDAO {
	//método que registra una Inscripcion y retorna un entero
			int save(Inscripcion bean);
			//método que actualiza una Inscripcion y retorna un entero
			int update(Inscripcion bean);
			//método deleteById que elimina una Inscripcion según su código  y retorna un entero
			int deleteById(int cod);
			//método findById busca código de un Inscripcion y retorna un objeto VOLUNTARIO
			Inscripcion findById(int cod);
			//Lista EInscripcion
		public List<Inscripcion> findAll();
}
