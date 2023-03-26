package com.example.bubmblebb.DAO;

import com.example.bubmblebb.entity.Cart;
import com.example.bubmblebb.entity.ProductDetails;

import java.util.List;

public interface CartDAO {

    public  boolean addCart(Cart c);
    public List<Cart> getProductByUser(int userId);

    public boolean deleteProduct(int pid, int uid, int cid);

}
