package ong.entity;

public class CuentaAp {
	private int numero;
	private String dueño;
	private int cvc;
	private int mes;
	private int año;
	private double saldoactual;
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getDueño() {
		return dueño;
	}
	public void setDueño(String dueño) {
		this.dueño = dueño;
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
	public double getSaldoactual() {
		return saldoactual;
	}
	public void setSaldoactual(double saldoactual) {
		this.saldoactual = saldoactual;
	}
	
}
