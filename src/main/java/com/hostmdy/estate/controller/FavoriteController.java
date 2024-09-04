package com.hostmdy.estate.controller;

import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.estate.model.Favorite;
import com.hostmdy.estate.model.FavoriteDAO;
import com.hostmdy.estate.model.Property;
import com.hostmdy.estate.model.User;
import com.hostmdy.estate.model.Mode;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/favorite")
public class FavoriteController extends HttpServlet {
   
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/estate_app")
    private DataSource dataSource;

    private FavoriteDAO favoriteDAO;
  

    @Override
    public void init() throws ServletException {
        favoriteDAO = new FavoriteDAO(dataSource);
       
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String param = req.getParameter("mode");
        Mode mode = null;

        if (param == null) {
            mode = Mode.LISTFAV;
        } else {
            mode = Mode.valueOf(param);
        }
        
        switch (mode) {
            case LISTFAV:
                listFavorites(req, resp);
                break;
            case ADD:
                addFavorite(req, resp);
                break;
            case REMOVE:
            	removeFavorite(req, resp);
            	break;
                  
            default:
                listFavorites(req, resp);
                break;
        }
    }

    private void listFavorites(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser != null) {
            List<Property> favoriteList = favoriteDAO.getFavoritesByUser(currentUser.getId());
            req.setAttribute("favoriteList", favoriteList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("template/property/favorite.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("template/index.jsp");
        }
    }
        
        

    private void addFavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");
        String propertyIdString = req.getParameter("propertyId");

        if (currentUser != null && propertyIdString != null && !propertyIdString.isEmpty()) {
            Long propertyId = Long.parseLong(propertyIdString);
            Favorite favorite = new Favorite(currentUser.getId(), propertyId);
            favoriteDAO.addFavorite(favorite);
            resp.sendRedirect("property?mode=SINGLE&propertyId=" + propertyId);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().println("ERROR!!! User or Property ID is missing");
        }
    }
    
    private void removeFavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");
        String propertyIdString = req.getParameter("propertyId");

        if (currentUser != null && propertyIdString != null && !propertyIdString.isEmpty()) {
            Long propertyId = Long.parseLong(propertyIdString);
            favoriteDAO.removeFavorite(currentUser.getId(), propertyId);
            resp.sendRedirect("property?mode=SINGLE&propertyId=" + propertyId);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("ERROR!!! User or Property ID is required.");
        }
    }
    
    
    
   
   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
