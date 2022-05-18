package producto;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import model.Category;
import model.CategoryDao;

import java.util.HashMap;
import java.util.Map;

public class ProductosAction extends ActionSupport {
    private static final long serialVersionUID = 1L;

    String params;
    Map<String,Object> result = new HashMap<>();
    private Producto producto = new Producto();
    ProductoDao productoDao = new ProductoDao();


    public String execute() throws Exception {
        Gson gs = new Gson();
        producto = gs.fromJson(params,Producto.class);
        result.put("registered", productoDao.register(producto));
        return SUCCESS;
    }
    public String delete() throws Exception {
        Gson gs = new Gson();
        producto = gs.fromJson(params,Producto.class);
        result.put("deleted",productoDao.delete(producto));
        return SUCCESS;
    }


    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public Map<String, Object> getResult() {
        return result;
    }

}
