package ong.entity;

public class DonacionFisica {
	private int idFisico;
	private int dniDonantes;
	private int idLocal;
	private String nombreLocal;
	private String descripcion;
	private boolean estado;
	public int getDniDonantes() {
		return dniDonantes;
	}
	public void setDniDonantes(int dniDonantes) {
		this.dniDonantes = dniDonantes;
	}
	public int getIdLocal() {
		return idLocal;
	}
	public void setIdLocal(int idLocal) {
		this.idLocal = idLocal;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public int getIdFisico() {
		return idFisico;
	}
	public void setIdFisico(int idFisico) {
		this.idFisico = idFisico;
	}
	public String getNombreLocal() {
		return nombreLocal;
	}
	public void setNombreLocal(String nombreLocal) {
		this.nombreLocal = nombreLocal;
	}
	
	
}
