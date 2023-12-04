package domain;

public class Cliente {
    private int idcliente;
    private String nombre;
    private int edad;
    private String telefono;
    private String correo;

    
    public Cliente(int idciente, String nombre, int edad, String telefono, String correo) {
        this.idcliente = idciente; 
        this.nombre = nombre;
        this.edad = edad;
        this.telefono = telefono;
        this.correo = correo;
    }

    public Cliente(String nombre, int edad, String telefono, String correo) {
        this.nombre = nombre;
        this.edad = edad;
        this.telefono = telefono;
        this.correo = correo;
    }

    public Cliente(int idcliente) {
        this.idcliente = idcliente;
    }

    
    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }
    
    

    public Cliente() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idcliente=" + idcliente + ", nombre=" + nombre + ", edad=" + edad + ", telefono=" + telefono + ", correo=" + correo + '}';
    }
    
    
    
}
