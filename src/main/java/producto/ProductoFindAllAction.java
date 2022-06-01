package producto;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import model.Category;
import model.CategoryDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductoFindAllAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    String params;
    Map<String,Object> result = new HashMap<>();
    private Category category = new Category();
    CategoryDao categoryDao = new CategoryDao();

    ProductoDao productoDao = new ProductoDao();
    List<Producto> productoList = new ArrayList<>();

    public String execute() throws Exception {
        productoList = productoDao.findAll();
        return SUCCESS;
    }

    public String info() throws Exception {
        Gson gs = new Gson();
        category = gs.fromJson(params, Category.class);
        System.out.println(category);
        result.put("info",productoDao.findbyCategory(category));
        return SUCCESS;
    }


    public List<Producto> getProductoList() {
        return productoList;
    }

    public void setProductoList(List<Producto> productoList) {
        this.productoList = productoList;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }
    public Map<String, Object> getResult() {
        return result;
    }

    public void setResult(Map<String, Object> result) {
        this.result = result;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public ProductoDao getProductoDao() {
        return productoDao;
    }

    public void setProductoDao(ProductoDao productoDao) {
        this.productoDao = productoDao;
    }
}
