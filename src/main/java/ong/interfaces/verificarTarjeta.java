package ong.interfaces;
import ong.entity.*;
public interface verificarTarjeta {
	 boolean verificacionTarjeta(Tarjeta bean);
	 int ActualizarSaldo(Tarjeta bean);
	 double saldoTarjeta(Tarjeta bean);
}
