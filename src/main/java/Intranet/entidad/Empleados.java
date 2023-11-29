package Intranet.entidad;

public class Empleados {
	private int codigo;
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
	private int rolNumber;
	private Roles rol;
	private int idONG;
	private int depaNumber;
	private Departamento depa;
	private String nombre_rol;
	private String nombre_departamento;
	private byte[] salt;
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getDni() {
		return dni;
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
	public int getRolNumber() {
		return rolNumber;
	}
	public void setRolNumber(int rolNumber) {
		this.rolNumber = rolNumber;
	}
	public Roles getRol() {
		return rol;
	}
	public void setRol(Roles rol) {
		this.rol = rol;
	}
	public int getIdONG() {
		return idONG;
	}
	public void setIdONG(int idONG) {
		this.idONG = idONG;
	}
	public int getDepaNumber() {
		return depaNumber;
	}
	public void setDepaNumber(int depaNumber) {
		this.depaNumber = depaNumber;
	}
	public Departamento getDepa() {
		return depa;
	}
	public void setDepa(Departamento depa) {
		this.depa = depa;
	}
	public String getNombre_rol() {
		return nombre_rol;
	}
	public void setNombre_rol(String nombre_rol) {
		this.nombre_rol = nombre_rol;
	}
	public String getNombre_departamento() {
		return nombre_departamento;
	}
	public void setNombre_departamento(String nombre_departamento) {
		this.nombre_departamento = nombre_departamento;
	}
	public byte[] getSalt() {
		return salt;
	}
	public void setSalt(byte[] salt) {
		this.salt = salt;
	}
	
}
