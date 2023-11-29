package ong.entity;

public class Especialidad {
	
	private int Id_Especialidades;
	private String nombre;
	private int inscritos;
	
	public int getIdEspecialidades() {
		return Id_Especialidades;
	}
	public void setIdEspecialidades(int idEspecialidades) {
		Id_Especialidades = idEspecialidades;
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
