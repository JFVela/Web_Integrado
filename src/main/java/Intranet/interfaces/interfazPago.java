package Intranet.interfaces;

import java.util.List;

import Intranet.entidad.Pago;

public interface interfazPago {
	public int save(Pago bean);
	public int update(Pago bean);
	public int deleteID(int id);
	Pago finById(int id);
	List<Pago> findAll();

}
