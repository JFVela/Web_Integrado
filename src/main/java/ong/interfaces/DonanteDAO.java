package ong.interfaces;

import java.util.List;

import ong.entity.Donante;

public interface DonanteDAO {
	int insertar(Donante bean);
	List<Donante> findAll();
	Donante findById(int dni);
	int update(Donante bean,int dniActual);
	int deleteById(int cod);
	boolean verificarDNI(int dni);
	boolean verificarDonacion(int dni);
}
