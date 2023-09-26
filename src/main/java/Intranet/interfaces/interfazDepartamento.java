package Intranet.interfaces;

import java.util.List;

import Intranet.entidad.Departamento;

public interface interfazDepartamento {
	public int save(Departamento bean);

	public int update(Departamento bean);

	public int deleteID(int id);

	Departamento findById(int id);

	List<Departamento> FindAll();

}
