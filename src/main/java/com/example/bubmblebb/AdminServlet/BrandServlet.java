package com.example.bubmblebb.AdminServlet;

import com.example.bubmblebb.entity.Brand;
import com.example.bubmblebb.model.BrandDBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BrandServlet", value = "/BrandServlet")
public class BrandServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Brand> brandList = BrandDBUtil.getBrandList();
        request.setAttribute("brandList",brandList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminBrands.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String brandName = request.getParameter("brandName");

        boolean isTrue;
        isTrue = BrandDBUtil.insertBrand(brandName);

        if(isTrue == true)
        {
            // Redirect to BrandsServlet
            response.sendRedirect(request.getContextPath() + "/Brands");
        }
        else
        {
            response.setContentType("text/html");
            response.getWriter().write("<script>alert('An error has occurred');</script>");

            // Redirect to AdminBrandsServlet
            response.sendRedirect(request.getContextPath() + "/Brands");

        }



    }
}
