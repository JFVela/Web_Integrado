package ong.entity;

public class Tarjeta {
	private int numCuenta;
	private int cvc;
	private int mes;
	private int año;
	private double saldo;
	public int getNumCuenta() {
		return numCuenta;
	}
	public void setNumCuenta(int numCuenta) {
		this.numCuenta = numCuenta;
	}
	public int getCvc() {
		return cvc;
	}
	public void setCvc(int cvc) {
		this.cvc = cvc;
	}
	public int getMes() {
		return mes;
	}
	public void setMes(int mes) {
		this.mes = mes;
	}
	public int getAño() {
		return año;
	}
	public void setAño(int año) {
		this.año = año;
	}
	public double getSaldo() {
		return saldo;
	}
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	
}
