/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import static datos.Conexion.close;
import domain.Cliente;
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
public class ClienteDAO {
     private static final String SQL_SELECT = "SELECT * FROM cliente";
     
     private static final String SQL_UPDATE = "UPDATE cliente "
            + " SET nombre=?, edad=?, telefono=?, correo=? WHERE idcliente=?";

    private static final String SQL_INSERT = "INSERT INTO cliente(nombre, edad, telefono, correo) "
            + " VALUES(?, ?, ?, ? )";

    private static final String SQL_DELETE = "DELETE FROM cliente WHERE idcliente = ?";
    
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM cliente WHERE idcliente = ?";
    
    public List<Cliente> listar() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cliente cliente = null;
        List<Cliente> clientes = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idCliente = rs.getInt("idCliente");
                String nombre = rs.getString("nombre");
                int edad = rs.getInt("edad");
                String telefono = rs.getString("telefono");
                String email = rs.getString("correo");

                cliente = new Cliente(idCliente, nombre, edad, telefono, email);
                clientes.add(cliente);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return clientes;
    }
    
    public int delete(Cliente cliente){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, cliente.getIdcliente());
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally{
            Conexion.close(stmt);
            Conexion.close(conn);
        }      
        return rows;
    }
    
    public Cliente encontrar(Cliente cliente) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, cliente.getIdcliente() );
            rs = stmt.executeQuery();
            rs.next();
            cliente.setNombre(rs.getString("nombre"));
            cliente.setEdad(rs.getInt("edad"));
            cliente.setTelefono(rs.getString("telefono"));
            cliente.setCorreo(rs.getString("correo"));
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return cliente;
    }
    
    public int insertar(Cliente cliente) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, cliente.getNombre());
            stmt.setInt(2, cliente.getEdad());
            stmt.setString(3, cliente.getTelefono());
            stmt.setString(4, cliente.getCorreo());
            

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int update(Cliente cliente){
        System.out.println(cliente);
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE); 
            stmt.setString(1, cliente.getNombre());
            stmt.setInt(2, cliente.getEdad());
            stmt.setString(3, cliente.getTelefono());
            stmt.setString(4, cliente.getCorreo());
            stmt.setInt(5, cliente.getIdcliente());
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally{
            close(stmt);
            close(conn);
        }
        
        return rows;
    }
    
}
