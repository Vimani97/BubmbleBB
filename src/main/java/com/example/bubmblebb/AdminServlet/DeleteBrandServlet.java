package com.example.bubmblebb.AdminServlet;

import com.example.bubmblebb.model.BrandDBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteBrandServlet", value = "/DeleteBrandServlet")
public class DeleteBrandServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brandID = request.getParameter("id");

        boolean isTrue;
        isTrue = BrandDBUtil.deleteBrand(brandID);

        if(isTrue == true)
        {

            // Redirect to AdminBrandsServlet
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
