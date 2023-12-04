/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;


import static datos.Conexion.close;
import domain.Cliente;
import domain.Producto;
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
public class ProductoDAO {
    private static final String SQL_SELECT = "SELECT * FROM productos";
    private static final String SQL_INSERT = "INSERT INTO productos(nombre, precio, descripcion, stock, gramaje, cantidad)"
            + " VALUES(?, ?, ?, ?, ?, ? )";
    private static final String SQL_UPDATE = "UPDATE productos "
            + " SET nombre=?, precio=?, descripcion=?, stock=?, gramaje=?, cantidad = ?  WHERE idproductos = ?";

    private static final String SQL_DELETE = "DELETE FROM productos WHERE idproductos = ?";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM productos WHERE idproductos = ?";
    public List<Producto> listar() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Producto producto;
        List<Producto> productos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idProducto = rs.getInt("idproductos");
                String nombre = rs.getString("nombre");
                double precio = rs.getDouble("precio");
                String descripcion = rs.getString("descripcion");
                int stock = rs.getInt("stock");
                String gramaje = rs.getString("gramaje");
                int cantidad = rs.getInt("cantidad");
                
                        
                producto = new Producto(idProducto, nombre, precio, descripcion, stock, gramaje, cantidad); 
                productos.add(producto);
                //System.out.println(producto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return productos;
    }
    
    
    public int delete(Producto producto){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, producto.getIdProducto());
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally{
            Conexion.close(stmt);
            Conexion.close(conn);
        }      
        return rows;
    }
    
    public int insertar(Producto producto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, producto.getNombre());
            stmt.setDouble(2, producto.getPrecio());
            stmt.setString(3, producto.getDescripcion());
            stmt.setInt(4, producto.getStock());
            stmt.setString(5, producto.getGramaje());
            stmt.setInt(6, producto.getCantidad());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }
    
    
    public int update(Producto producto){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE); 
            stmt.setString(1, producto.getNombre());
            stmt.setDouble(2, producto.getPrecio());
            stmt.setString(3, producto.getDescripcion());
            stmt.setInt(4, producto.getStock());
            stmt.setString(5, producto.getGramaje());
            stmt.setInt(6, producto.getCantidad());
            stmt.setInt(7, producto.getIdProducto());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally{
            close(stmt);
            close(conn);
        }
        
        return rows;
    }
    
    public Producto encontrar(Producto producto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, producto.getIdProducto());
            rs = stmt.executeQuery();
            rs.next();
            producto.setNombre(rs.getString("nombre"));
            producto.setPrecio(rs.getDouble("precio"));
            producto.setDescripcion(rs.getString("descripcion"));
            producto.setStock(rs.getInt("stock"));
            producto.setGramaje(rs.getString("gramaje"));
            producto.setCantidad(rs.getInt("cantidad"));
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return producto;
    }
    
    public boolean actualizarStock(Producto producto, int cantidad){
        return true;
    }
}
