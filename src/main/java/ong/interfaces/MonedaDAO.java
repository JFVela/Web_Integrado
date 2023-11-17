package ong.interfaces;

import java.util.List;

import ong.entity.Moneda;


public interface MonedaDAO {
	int save(Moneda bean);
	int update(Moneda bean);
	int deleteById(int id);
	Moneda findById(int id);
	public List<Moneda> findAll();
}
