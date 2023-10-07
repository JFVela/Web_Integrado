package ong.interfaces;

import java.util.List;

import ong.entity.Donante;

public interface DonanteDAO {
	int insertar(Donante bean);
	List<Donante> findAll();
}
