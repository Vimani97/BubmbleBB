package com.example.bubmblebb.DAO;

import com.example.bubmblebb.entity.Product_order;

import java.util.List;

public interface Product_Order_DAO {

 //   public int getOrderNo();

    public boolean saveOrder(List<Product_order> plist);

    public List<Product_order> getProduct(String email);

    public List<Product_order> getAllOrder();

}
