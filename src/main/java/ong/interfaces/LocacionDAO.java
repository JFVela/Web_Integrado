package ong.interfaces;

import java.util.List;

import ong.entity.Donante;
import ong.entity.Locacion;

public interface LocacionDAO {
	public List<Locacion> findAll();
	int insertar(Locacion bean);
	Locacion findById(int dni);
	int update(Locacion bean);
	int deleteById(int cod);
	boolean verificarLocacion(int id);
}
