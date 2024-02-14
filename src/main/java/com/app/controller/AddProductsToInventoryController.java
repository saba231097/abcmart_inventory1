package com.app.controller;

import com.app.beans.Product;
import com.app.dao.ProductDAO;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addProducts")
public class AddProductsToInventoryController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jsonData=req.getParameter("data");
        ObjectMapper objectMapper=new ObjectMapper();
        Product[] products= objectMapper.readValue(jsonData, Product[].class);
        boolean addStatus=new ProductDAO().addProductsToInvenDB(products);
        if(addStatus){
            resp.getWriter().println("Successfully Added");
        }else{
            resp.getWriter().println("Failed to Add");
        }
    }
}
