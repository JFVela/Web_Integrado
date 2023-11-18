package ong.interfaces;

import java.util.List;

import ong.entity.Cuenta;

public interface CuentaDAO {
	public List<Cuenta> findAll();
}
