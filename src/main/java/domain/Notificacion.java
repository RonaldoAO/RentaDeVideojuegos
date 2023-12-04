/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package domain;

/**
 *
 * @author Ronaldo
 */
public class Notificacion {
    private int idNotificacion;
    private String encabezado;
    private String cuerpo;

    public Notificacion(int idNotificacion, String encabezado, String cuerpo) {
        this.idNotificacion = idNotificacion;
        this.encabezado = encabezado;
        this.cuerpo = cuerpo;
    }

    public String getEncabezado() {
        return encabezado;
    }

    public void setEncabezado(String encabezado) {
        this.encabezado = encabezado;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public int getIdNotificacion() {
        return idNotificacion;
    }

    public void setIdNotificacion(int idNotificacion) {
        this.idNotificacion = idNotificacion;
    }
    
    
}
