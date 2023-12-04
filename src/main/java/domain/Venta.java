/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package domain;

/**
 *
 * @author Ronaldo
 */
public class Venta {
    private int idVenta;
    private String fecha;
    private double total;
    private double cambio;
    private double pago;

    public Venta() {
    }

    public Venta(String fecha) {
        this.fecha = fecha;
    }

    
    public Venta(int idVenta, String fecha, double total, double cambio, double pago) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.total = total;
        this.cambio = cambio;
        this.pago = pago;
    }

    
    public Venta(int idVenta, String fecha, double total, double cambio) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.total = total;
        this.cambio = cambio;
    }

    public Venta(double total, double cambio, double pago) {
        this.total = total;
        this.cambio = cambio;
        this.pago = pago;
    }

    
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getPago() {
        return pago;
    }

    public void setPago(double pago) {
        this.pago = pago;
    }
    
    
 

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getCambio() {
        return cambio;
    }

    public void setCambio(double cambio) {
        this.cambio = cambio;
    }

    
    
    
}
