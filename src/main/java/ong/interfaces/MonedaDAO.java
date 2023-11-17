package ong.interfaces;

import java.util.List;

import ong.entity.Moneda;


public interface MonedaDAO {
	Moneda findById(int id);
	public List<Moneda> findAll();
}
