package ong.entity;

public class Especialidad {
	
	private int IdEspecialidades;
	private String nombre;
	private int inscritos;
	
	public int getIdEspecialidades() {
		return IdEspecialidades;
	}
	public void setIdEspecialidades(int idEspecialidades) {
		IdEspecialidades = idEspecialidades;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getInscritos() {
		return inscritos;
	}
	public void setInscritos(int inscritos) {
		this.inscritos = inscritos;
	}
	
}
