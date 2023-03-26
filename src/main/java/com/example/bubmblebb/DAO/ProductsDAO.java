package com.example.bubmblebb.DAO;

import com.example.bubmblebb.entity.ProductDetails;

import java.util.ArrayList;
import java.util.List;

public interface ProductsDAO {

    public boolean addProducts(ProductDetails p);

    public List<ProductDetails> getAllProducts();

    public ProductDetails getProductById(int product_Id);

    public boolean updateEditProduct(ProductDetails p);

    public boolean deleteProducts(int product_Id);

    public List<ProductDetails> getNewProduct();

    public List<ProductDetails> getRecentProducts();

    public List<ProductDetails> getOldProducts();

    public List<ProductDetails> getAllRecentProducts();

    public List<ProductDetails> getAllNewProducts();

    public List<ProductDetails> getAllOldProducts();

    public List<ProductDetails> getProductByOld(String email, String cate);
    public boolean oldProductDelete(String email, String cat, int id);
    public List<ProductDetails> getProductBySearch(String search);


}
