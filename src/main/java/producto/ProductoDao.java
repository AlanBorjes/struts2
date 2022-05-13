package producto;

import model.Category;
import model.CategoryDao;
import utils.ConnectionMysql;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    Statement statement;


    public boolean register(Producto producto){

        boolean state = false;
        try{
            con = ConnectionMysql.getConnection();
            String query = "insert into productos(marca, precio, categoria, nombre, unidades, descripcion) values(?,?,?,?,?,?);";
            pstm = con.prepareStatement(query);
            pstm.setString(1, producto.getNombre());
            pstm.setInt(2, producto.getPrecio());
            pstm.setInt(3,producto.getCategory().getId());
            pstm.setString(4,producto.getNombre());
            pstm.setInt(5,producto.getUnidades());
            pstm.setString(6,producto.getDescription());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return state;
    }

    public boolean update(Producto producto){
        boolean state = false;
        try {
            con = ConnectionMysql.getConnection();
            String query = "UPDATE tienda.productos SET  marca = ?, precio = ?, categoria = ?, nombre = ?,unidades= ?, descripcion = ? WHERE id = ?;\n";
            pstm = con.prepareStatement(query);
            pstm.setString(1, producto.getMarca());
            pstm.setInt(2, producto.getPrecio());
            pstm.setInt(3,producto.getCategory().getId() );;
            pstm.setString(4, producto.getNombre());
            pstm.setInt(5, producto.getUnidades());
            pstm.setString(6,producto.getDescription());
            pstm.setInt(7,producto.getId());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;

    }
    public List<Producto> findAll(){
        List<Producto> productoList = new ArrayList<>();
        try{
            con = ConnectionMysql.getConnection();
            String query = "select productos.id,productos.marca,productos.precio,productos.categoria, productos.nombre, productos.unidades,productos.descripcion from productos;";
            statement = con.createStatement();
            rs = statement.executeQuery(query);
            while(rs.next()){
                Producto producto = new Producto();
                producto.setId(rs.getInt("id"));
                producto.setMarca(rs.getString("marca"));
                producto.setPrecio(rs.getInt("precio"));
                producto.setNombre(rs.getString("nombre"));
                producto.setUnidades(rs.getInt("unidades"));
                producto.setDescription(rs.getString("descripcion"));
                Category category = new Category();
                int opc = rs.getInt("categoria");
                CategoryDao categoryDao = new CategoryDao();
                category = categoryDao.findby(opc);
                producto.setCategory(category);
                productoList.add(producto);
            }
            System.out.println(productoList);
        }catch(SQLException ex){
            ex.printStackTrace();
            return null;
        }finally{
            closeConnection();
        }
        return productoList;
    }


    public void closeConnection(){
        try{
            if(con != null){
                con.close();
            }
            if(pstm != null){
                pstm.close();
            }
            if(rs != null){
                rs.close();
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
    }
}
