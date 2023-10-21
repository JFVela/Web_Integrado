package ong.interfaces;

import java.util.List;

import ong.entity.DonacionFisica;

public interface DonacionFisicoDAO {
	int save(DonacionFisica bean);
	public List<DonacionFisica> findAll();
	DonacionFisica findById(int id);
	int update(DonacionFisica bean);
	int deleteById(int cod);
	int obtenerid(int dni);
}
