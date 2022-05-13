package model;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.Map;

public class CategoryAction extends ActionSupport {
    private static final long serialVersionUID = 1L;

    String params;
    Map<String,Object> result = new HashMap<>();
    private Category category = new Category();
    CategoryDao categoryDao = new CategoryDao();


    public String execute() throws Exception {
        Gson gs = new Gson();
        category = gs.fromJson(params,Category.class);
        result.put("registered",categoryDao.register(category));
        return SUCCESS;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public Map<String, Object> getResult() {
        return result;
    }

}
