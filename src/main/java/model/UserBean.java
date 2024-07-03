package model;

import java.io.Serializable;

public class UserBean implements Serializable {
	private static final long serialVersionUID = 2856723757650934254L;
	
	public UserBean() {
		email="";
		nome="";
		cognome="";
		telefono="";
		role="";
	}
	
	public void setEmail(String newEmail) {
		email = newEmail;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setNome(String newNome) {
		nome = newNome;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setCognome(String newCognome) {
		cognome = newCognome;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	
	public void setTelefono(String newTelefono) {
		telefono = newTelefono;
	}
	
	public String getTelefono() {
		return telefono;
	}
	
	public void setRole(String newRole) {
		role = newRole;
	}
	
	public String getRole() {
		return role;
	}
	
	private String email;
	private String nome;
	private String cognome;
	private String telefono;
	private String role;
}