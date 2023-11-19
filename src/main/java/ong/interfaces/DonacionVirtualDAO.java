package ong.interfaces;

import java.util.List;

import ong.entity.DonacionFisica;
import ong.entity.DonacionVirtual;

public interface DonacionVirtualDAO {
	int save(DonacionVirtual bean);
	public List<DonacionVirtual> findAll();
	double valormoneda(int idmoneda);
}
