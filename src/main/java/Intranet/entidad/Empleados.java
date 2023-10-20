package Intranet.entidad;

public class Empleados {
	private int dni;
	private String login;
	private String contraseña;
	private String nombre;
	private String paterno;
	private String materno;
	private int telefono;
	private String correo;
	private String direccion;
	private double sueldo;
	private int id_rol;
	private int idONG;
	private int id_depa;
	private String nombreRol;
	private String nombreDepa;

	public int getDni() {
		return dni;
	}

	public String getNombreRol() {
		return nombreRol;
	}

	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}

	public String getNombreDepa() {
		return nombreDepa;
	}

	public void setNombreDepa(String nombreDepa) {
		this.nombreDepa = nombreDepa;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPaterno() {
		return paterno;
	}

	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}

	public String getMaterno() {
		return materno;
	}

	public void setMaterno(String materno) {
		this.materno = materno;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public double getSueldo() {
		return sueldo;
	}

	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}

	public int getId_rol() {
		return id_rol;
	}

	public void setId_rol(int id_rol) {
		this.id_rol = id_rol;
	}

	public int getIdONG() {
		return idONG;
	}

	public void setIdONG(int idONG) {
		this.idONG = idONG;
	}

	public int getId_depa() {
		return id_depa;
	}

	public void setId_depa(int id_depa) {
		this.id_depa = id_depa;
	}

}
