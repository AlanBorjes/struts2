package model;
import producto.Producto;
import utils.ConnectionMysql;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    Statement statement;
    public boolean register(Category category){

        boolean state = false;
        try{
            con = ConnectionMysql.getConnection();
            String query = "insert into category(nombre, descripcion) values(?,?);";
            pstm = con.prepareStatement(query);
            pstm.setString(1, category.getNombre());
            pstm.setString(2, category.getDescripcion());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return state;
    }
    public List<Category> findAll(){
        List<Category> categoryList = new ArrayList<>();
        try{
            con = ConnectionMysql.getConnection();
            String query = "select category.id, category.nombre, category.descripcion from category;";
            statement = con.createStatement();
            rs = statement.executeQuery(query);
            while(rs.next()){
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setNombre(rs.getString("nombre"));
                category.setDescripcion(rs.getString("descripcion"));
                categoryList.add(category);

            }
            System.out.println(categoryList);
        }catch(SQLException ex){
            ex.printStackTrace();
            return null;
        }finally{
            closeConnection();
        }
        return categoryList;
    }
    public Category findby(int id){
        Category category = new Category();
        try {
            con = ConnectionMysql.getConnection();
            String query = "select * from category where category.id= ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1,id);
            rs = pstm.executeQuery();
            if (rs.next()){
                category.setId(rs.getInt("id"));
                category.setNombre(rs.getString("nombre"));
                category.setDescripcion(rs.getString("descripcion"));
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            closeConnection();
        }
        return category;
    }
    public boolean delete(Category category){
        boolean state = false;
        try{
            con = ConnectionMysql.getConnection();
            String query = "delete from category where id = ?;";
            pstm = con.prepareStatement(query);
            pstm.setInt(1, category.getId());
            state = pstm.executeUpdate() == 1;
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            closeConnection();
        }
        return state;
    }
    public boolean update(Category category){
        boolean state = false;
        try {
            con = ConnectionMysql.getConnection();
            String query = "UPDATE tienda.category SET   nombre = ?, descripcion = ? WHERE id = ?;\n";
            pstm = con.prepareStatement(query);
            pstm.setString(1, category.getNombre());
            pstm.setString(2,category.getDescripcion());
            pstm.setInt(3,category.getId());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;

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
