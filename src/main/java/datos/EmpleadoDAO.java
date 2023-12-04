/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import domain.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ronaldo
 */
public class EmpleadoDAO {


    private static final String SQL_INSERT = "INSERT INTO empleado(nombre, correo ,telefono, password) "
            + " VALUES(?, ?, ?, ? )";

    
    private static final String LOGIN = "SELECT * FROM empleado WHERE (correo = ? OR nombre = ?) AND password = ?";

    

   
    public Empleado login(Empleado empleado) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(LOGIN);
            stmt.setString(1, empleado.getNombre());
            stmt.setString(2, empleado.getNombre());
            stmt.setString(3, empleado.getContrasenia());
            rs = stmt.executeQuery();
            if(rs.next()){
                empleado.setCorreo(rs.getString("correo"));
                empleado.setNombre(rs.getString("nombre"));
                empleado.setTelefono(rs.getString("telefono"));
            }else{
                return null;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return empleado;
    }
    /*
    * Metodo hecho para confirmar la existencia del correo en el registro
    * true = yes
    * false = no
     */
    
    
    public int insertar(Empleado empleado) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, empleado.getNombre());
            stmt.setString(2, empleado.getCorreo());
            stmt.setString(3, empleado.getTelefono());
            stmt.setString(4, empleado.getContrasenia());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    

}
