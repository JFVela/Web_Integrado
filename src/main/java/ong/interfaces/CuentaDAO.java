package ong.interfaces;

import java.util.List;

import ong.entity.Cuenta;

public interface CuentaDAO {
	int recargarCuenta (Cuenta bean);
	public List<Cuenta> findAll();
}
