package producto;

import model.Category;

public class Producto {
    private int id = 0;
    private String marca = "";
    private int precio = 0;
    private Category category;
    private String nombre = "";
    private int unidades = 0;
    private String description = "";

    private String image = "";

    public Producto() {
    }

    public Producto(int id, String marca, int precio, Category category, String nombre, int unidades, String description, String image) {
        this.id = id;
        this.marca = marca;
        this.precio = precio;
        this.category = category;
        this.nombre = nombre;
        this.unidades = unidades;
        this.description = description;
        this.image = image;
    }

    public Producto(String marca, int precio, Category category, String nombre, int unidades, String description, String image) {
        this.marca = marca;
        this.precio = precio;
        this.category = category;
        this.nombre = nombre;
        this.unidades = unidades;
        this.description = description;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}