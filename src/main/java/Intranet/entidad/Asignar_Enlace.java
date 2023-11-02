package Intranet.entidad;

public class Asignar_Enlace {
	private int roles_id_rol;
	private String nombreRol;
	private int enlace_id_enlace;
	private String nombreEnlace;

	public String getNombreRol() {
		return nombreRol;
	}

	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}

	public String getNombreEnlace() {
		return nombreEnlace;
	}

	public void setNombreEnlace(String nombreEnlace) {
		this.nombreEnlace = nombreEnlace;
	}

	public int getRoles_id_rol() {
		return roles_id_rol;
	}

	public void setRoles_id_rol(int roles_id_rol) {
		this.roles_id_rol = roles_id_rol;
	}

	public int getEnlace_id_enlace() {
		return enlace_id_enlace;
	}

	public void setEnlace_id_enlace(int enlace_id_enlace) {
		this.enlace_id_enlace = enlace_id_enlace;
	}

}
