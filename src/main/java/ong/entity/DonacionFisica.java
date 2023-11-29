package ong.entity;

public class DonacionFisica {
	private int id_fisica;
	private String nombre;
	private String descripcion;
	private boolean estado;
	private Donante donan ;
	private Locacion local_don ; //prueba sino local
	private int donan_dni;
	private int local_id;
	public int getId_fisica() {
		return id_fisica;
	}
	public void setId_fisica(int id_fisica) {
		this.id_fisica = id_fisica;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public Donante getDonan() {
		return donan;
	}
	public void setDonan(Donante donan) {
		this.donan = donan;
	}
	public Locacion getLocal_don() {
		return local_don;
	}
	public void setLocal_don(Locacion local_don) {
		this.local_don = local_don;
	}
	public int getDonan_dni() {
		return donan_dni;
	}
	public void setDonan_dni(int donan_dni) {
		this.donan_dni = donan_dni;
	}
	public int getLocal_id() {
		return local_id;
	}
	public void setLocal_id(int local_id) {
		this.local_id = local_id;
	}

	
}
