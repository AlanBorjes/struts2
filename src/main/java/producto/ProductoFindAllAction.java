package producto;

import com.opensymphony.xwork2.ActionSupport;
import model.Category;

import java.util.ArrayList;
import java.util.List;

public class ProductoFindAllAction extends ActionSupport {
    private static final long serialVersionUID = 1L;

    ProductoDao productoDao = new ProductoDao();
    List<Producto> productoList = new ArrayList<>();


    public String execute() throws Exception {
        productoList = productoDao.findAll();
        return SUCCESS;
    }

    public List<Producto> getProductoList() {
        return productoList;
    }

    public void setProductoList(List<Producto> productoList) {
        this.productoList = productoList;
    }
}
