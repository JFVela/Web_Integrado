package ong.interfaces;

import java.util.List;
import ong.entity.*;

public interface Tipo_donacionDAO {
	int save(Tipo_Donacion bean);
	int update (Tipo_Donacion bean);
	int deleteById(int id);
	Tipo_Donacion findById(int id);
	public List<Tipo_Donacion> findAll();
}
