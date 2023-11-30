package ong.entity;

public class DonacionVirtualAp {
	private int codigo;
	private int donantesdni;
	private CampañaAp campaña;
	private MonedaAp moneda;
	private double monto;
	private CuentaAp cuenta;
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getDonantesdni() {
		return donantesdni;
	}
	public void setDonantesdni(int donantesdni) {
		this.donantesdni = donantesdni;
	}
	public CampañaAp getCampaña() {
		return campaña;
	}
	public void setCampaña(CampañaAp campaña) {
		this.campaña = campaña;
	}
	public MonedaAp getMoneda() {
		return moneda;
	}
	public void setMoneda(MonedaAp moneda) {
		this.moneda = moneda;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public CuentaAp getCuenta() {
		return cuenta;
	}
	public void setCuenta(CuentaAp cuenta) {
		this.cuenta = cuenta;
	}
}
