package producto;

import com.opensymphony.xwork2.ActionSupport;
import model.Category;

import javax.swing.text.Caret;
import java.util.ArrayList;
import java.util.List;

public class ProductoFindCategoy extends ActionSupport {
    private static final long serialVersionUID = 1L;
    int id;

    ProductoDao productoDao = new ProductoDao();
    List<Producto> productoList = new ArrayList<>();

    public List<Producto> getProductoList() {
        return productoList;
    }

    public void setProductoList(List<Producto> productoList) {
        this.productoList = productoList;
    }

    public void setId(int id) {
        this.id = id;
    }
}


