package ong.entity;

public class DonacionVirtual {
	private int dniDonante;
	private int idCampaña;
	private int tipoDonacion;
	private int idMoneda;
	private double monto;
	private int numCuenta;
	public int getDniDonante() {
		return dniDonante;
	}
	public void setDniDonante(int dniDonante) {
		this.dniDonante = dniDonante;
	}
	public int getIdCampaña() {
		return idCampaña;
	}
	public void setIdCampaña(int idCampaña) {
		this.idCampaña = idCampaña;
	}
	public int getTipoDonacion() {
		return tipoDonacion;
	}
	public void setTipoDonacion(int tipoDonacion) {
		this.tipoDonacion = tipoDonacion;
	}
	public int getIdMoneda() {
		return idMoneda;
	}
	public void setIdMoneda(int idMoneda) {
		this.idMoneda = idMoneda;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double d) {
		this.monto = d;
	}
	public int getNumCuenta() {
		return numCuenta;
	}
	public void setNumCuenta(int numCuenta) {
		this.numCuenta = numCuenta;
	}
	
	
}
