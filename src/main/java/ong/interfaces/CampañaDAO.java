package ong.interfaces;

import java.util.List;

import ong.entity.Campaña;


public interface CampañaDAO {
	int save(Campaña bean);
	int update (Campaña bean);
	int deleteById(int id);
	Campaña findById(int id);
	public List<Campaña> findAll();

}
