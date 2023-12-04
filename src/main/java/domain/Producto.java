/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package domain;

/**
 *
 * @author Ronaldo
 */
public class Producto {
    private int idProducto;
    private String nombre;
    private double precio;
    private String descripcion;
    private int stock;
    private String gramaje;
    private int cantidad;

    public Producto(int idProducto, double precio, String descripcion, int stock, String gramaje, int cantidad) {
        this.idProducto = idProducto;
        this.precio = precio;
        this.descripcion = descripcion;
        this.stock = stock;
        this.gramaje = gramaje;
        this.cantidad = cantidad;
    }

    public Producto(int idProducto, String nombre, double precio, String descripcion, int stock, String gramaje, int cantidad) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.stock = stock;
        this.gramaje = gramaje;
        this.cantidad = cantidad;
    }
    
    

    public Producto(int idProducto, double precio, String descripcion, int stock, String gramaje) {
        this.idProducto = idProducto;
        this.precio = precio;
        this.descripcion = descripcion;
        this.stock = stock;
        this.gramaje = gramaje;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    

    public Producto(int idProducto) {
        this.idProducto = idProducto;
    }

    
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getGramaje() {
        return gramaje;
    }

    public void setGramaje(String gramaje) {
        this.gramaje = gramaje;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", precio=" + precio + ", descripcion=" + descripcion + ", stock=" + stock + ", gramaje=" + gramaje + ", cantidad=" + cantidad + '}';
    }
    
    
    
}
