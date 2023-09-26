package Intranet.interfaces;

import java.util.List;

import Intranet.entidad.Roles;

public interface interfazRoles {
	public int save(Roles bean);
	public int update(Roles bean);
	public int deleteID(int id);
	Roles finById(int id);
	List<Roles> findAll();
}
