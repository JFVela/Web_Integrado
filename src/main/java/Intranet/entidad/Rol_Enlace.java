package Intranet.entidad;

public class Rol_Enlace {
	private int ID_rol;
	private String nombre_Rol;
	private int ID_Enlace;
	private String nombre_Enlace;

	public int getID_rol() {
		return ID_rol;
	}

	public void setID_rol(int iD_rol) {
		ID_rol = iD_rol;
	}

	public String getNombre_Rol() {
		return nombre_Rol;
	}

	public void setNombre_Rol(String nombre_Rol) {
		this.nombre_Rol = nombre_Rol;
	}

	public int getID_Enlace() {
		return ID_Enlace;
	}

	public void setID_Enlace(int iD_Enlace) {
		ID_Enlace = iD_Enlace;
	}

	public String getNombre_Enlace() {
		return nombre_Enlace;
	}

	public void setNombre_Enlace(String nombre_Enlace) {
		this.nombre_Enlace = nombre_Enlace;
	}

}
