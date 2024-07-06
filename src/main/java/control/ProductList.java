package control;



import java.io.IOException;

import java.sql.SQLException;

import java.util.List;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import model.ProductBean;

import model.ProductDAODataSource;



@WebServlet("/ProductList")

public class ProductList extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAODataSource productDAO = new ProductDAODataSource();



    public ProductList() {

        super();

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            List<ProductBean> productList = productDAO.doRetrieveAll("Nome_auto");

            request.setAttribute("productList", productList);

        } catch (SQLException e) {

            e.printStackTrace();

            request.setAttribute("error", "Database error: " + e.getMessage());

        }



        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");

        dispatcher.forward(request, response);

    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);

    }

}