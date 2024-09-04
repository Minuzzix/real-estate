package com.hostmdy.estate.controller;


import java.io.IOException;

import java.util.List;


import javax.sql.DataSource;

import com.hostmdy.estate.model.Favorite;
import com.hostmdy.estate.model.FavoriteDAO;
import com.hostmdy.estate.model.Mode;
import com.hostmdy.estate.model.Property;
import com.hostmdy.estate.model.PropertyDAO;
import com.hostmdy.estate.model.Recommend;
import com.hostmdy.estate.model.RecommendDAO;
import com.hostmdy.estate.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/property")
public class PropertyController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/estate_app")
	private DataSource dataSource;

	private PropertyDAO propertyDAO;
	private FavoriteDAO favoriteDAO;
	private RecommendDAO recommendDAO;
	

	@Override
	public void init() throws ServletException {
		propertyDAO = new PropertyDAO(dataSource);
		favoriteDAO = new FavoriteDAO(dataSource);
		recommendDAO = new RecommendDAO(dataSource);
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		user = (User) session.getAttribute("user");

		String param = req.getParameter("mode");
		System.out.println("Param in property controller is "+ param);
		Mode mode = null;

		if (param == null) {
			mode = Mode.LIST;
		} else {
			mode = Mode.valueOf(param);
		}

		switch (mode) {
		case LIST:
			showAllList(req, resp);
			break;
		case SINGLE:
			showProperty(req, resp);
			break;
		case CREATE:
			createProperty(req, resp);
			break;
		case LOAD:
			loadProperty(req, resp);
			break;
		case UPDATE:
			updateProperty(req, resp);
			break;
		case DELETE:
			deleteProperty(req, resp);
			break;
		case SEARCH:
			searchProperty(req, resp);
			break;
		case LISTVIEW:
			System.out.println("Calling list view method");
			listPropertyByUser(req, resp);
			break;
		case ALL_PROPERTYVIEW:
			allPropertyView(req, resp);
			break;
		case VIEW_RECOMMEND:
			showAllList(req, resp);
			break;
		case ADD_RECOMMEND:
			addRecommend(req, resp);
			break;
		case ADVANCED_SEARCH:
            advancedSearchProperty(req, resp);
            break;
		default:
			showAllList(req, resp);
			break;
		}
	}
	
	private void advancedSearchProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String minPriceStr = req.getParameter("minPrice");
        String maxPriceStr = req.getParameter("maxPrice");
        String address = req.getParameter("address");
        String city = req.getParameter("city");
//        String bedroom = req.getParameter("bedroom");
//        String bathroom = req.getParameter("bathroom");
//        Boolean garage = Boolean.parseBoolean(req.getParameter("garage"));
//        Boolean pool = Boolean.parseBoolean(req.getParameter("pool"));
//        Boolean garden = Boolean.parseBoolean(req.getParameter("garden"));
//        Boolean gym = Boolean.parseBoolean(req.getParameter("gym"));

        Double minPrice = (minPriceStr != null && !minPriceStr.isEmpty()) ? Double.parseDouble(minPriceStr) : null;
        Double maxPrice = (maxPriceStr != null && !maxPriceStr.isEmpty()) ? Double.parseDouble(maxPriceStr) : null;

        List<Property> propertyList = propertyDAO.advancedSearchProperty(type, minPrice, maxPrice, address, city/*, bedroom, bathroom, garage, pool, garden, gym*/);
        req.setAttribute("propertyList", propertyList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
        dispatcher.forward(req, resp);
    }

	private void showAllList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Property>propertyList = propertyDAO.getAllProperties();
		req.setAttribute("propertyList", propertyList);
		 List<Recommend> recommendations = recommendDAO.getRecommendations();
	       req.setAttribute("recommendations", recommendations);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
		dispatcher.forward(req, resp);
	}
	

	
	private void showProperty2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("user");
		Long propertyId = Long.parseLong(req.getParameter("propertyId"));
		Property property = propertyDAO.getPropertyById(propertyId);
		req.setAttribute("property", property);
		req.setAttribute("currentUser", currentUser);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/property/property-details.jsp");
		

		dispatcher.forward(req, resp);

	}

	private void showProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("user");
		Long propertyId = Long.parseLong(req.getParameter("propertyId"));
		Property property = propertyDAO.getPropertyById(propertyId);
		System.out.println("Porperty id is "+propertyId);
		if(currentUser==null) {
			System.out.println("Without login user");
			showProperty2(req,resp);
		}
		else {
			
			System.out.println("With login user");
			
			//extract all rows from fav table
			List<Favorite> favoriteList = favoriteDAO.getFavoritesListByUser(currentUser.getId());
			for(Favorite fav : favoriteList) {
				System.out.println("propertyId is"+propertyId);
				System.out.println("user fav list :"+fav.getProperty_id());
				if(fav.getProperty_id().equals(propertyId)) {
					System.out.println("property in the fav list");
					property.setFavorite(true);
					break;
				}
			}
			req.setAttribute("property", property);
			req.setAttribute("currentUser", currentUser);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/property/property-details.jsp");
			

			dispatcher.forward(req, resp);
			
		}
		

	}
	
		private void listPropertyByUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("user");
		 System.out.println("Current user in listPropertyByUser: " + currentUser);
	
	
		List<Property> viewPropertyList = propertyDAO.getViewPropertyByUser(currentUser.getId());

		req.setAttribute("viewPropertyList", viewPropertyList);
	    req.setAttribute("userId", currentUser.getId());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/list-property.jsp");
		dispatcher.forward(req, resp);
		
	}

private void allPropertyView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
    List<Property>allPropertyList = propertyDAO.getAllViewProperties();
	
	
	req.setAttribute("allPropertyList", allPropertyList);
	RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-dashboard.jsp?view=property-list");
	dispatcher.forward(req, resp);
	
}


//	private void showNewPropertyForm(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		RequestDispatcher dispatcher = req.getRequestDispatcher("template/property/add-property.jsp");
//		dispatcher.forward(req, resp);
//	}

private void createProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session = req.getSession();
	User user = (User) session.getAttribute("user");
	String type = req.getParameter("type");
	Double price = Double.parseDouble(req.getParameter("price"));
	String address = req.getParameter("address");
	String image = req.getParameter("image");
	String description = req.getParameter("description");
	String city = req.getParameter("city");
	String bedroom = req.getParameter("bedroom");
	String bathroom = req.getParameter("bathroom");
	Boolean garage = Boolean.parseBoolean(req.getParameter("garage"));
	Boolean pool = Boolean.parseBoolean(req.getParameter("pool"));
	Boolean garden = Boolean.parseBoolean(req.getParameter("garden"));
	Boolean gym = Boolean.parseBoolean(req.getParameter("gym"));
	String createdUser = user.getUsername();
	
	

	Property property = new Property(type, price, address, image, description, user.getId(), city, bedroom, bathroom, garage, pool, garden, gym, createdUser);
	req.setAttribute("insertOk", propertyDAO.createProperty(property));
	System.out.println("In the fininded of create property function");
	showAllList(req, resp);
}



	private void loadProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("user");
		Long propertyId = Long.parseLong(req.getParameter("propertyId"));
		Property property = propertyDAO.getPropertyById(propertyId);
		if (currentUser != null && property.getUser_id().equals(currentUser.getId())) {
			req.setAttribute("property", property);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/property/property-details.jsp");
			dispatcher.forward(req, resp);
		} else {
			resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "You are not authorized to update this property.");
		}
		
	}

	private void updateProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Long id = Long.parseLong(req.getParameter("propertyId"));
		String type = req.getParameter("type");
		Double price = Double.parseDouble(req.getParameter("price"));
		String address = req.getParameter("address");
		String image = req.getParameter("image");
		String description = req.getParameter("description");
		String city = req.getParameter("city");
		String bedroom = req.getParameter("bedroom");
		String bathroom = req.getParameter("bathroom");
		Boolean garage = Boolean.parseBoolean(req.getParameter("garage"));
		Boolean pool = Boolean.parseBoolean(req.getParameter("pool"));
		Boolean garden = Boolean.parseBoolean(req.getParameter("garden"));
		Boolean gym = Boolean.parseBoolean(req.getParameter("gym"));
		String createdUser = user.getUsername();

		Property property = new Property(id, type, price, address, image, description, user.getId(), city, bedroom, bathroom, garage, pool, garden, gym, createdUser);
		boolean updateOk = propertyDAO.updateProperty(property);

		if (updateOk) {
			resp.sendRedirect("property?mode=SINGLE&propertyId=" + id);
		} else {
			req.setAttribute("updateOk", false);
			req.setAttribute("property", property);
			RequestDispatcher dispatcher = req.getRequestDispatcher("template/property/update-property.jsp");
			dispatcher.forward(req, resp);
		}
	}

	private void deleteProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Long propertyId = Long.parseLong(req.getParameter("propertyId"));
		boolean deleteOk = propertyDAO.deleteProperty(propertyId);

		if (deleteOk) {
			resp.sendRedirect("property");
		} else {
			resp.sendRedirect("property?mode=SINGLE&propertyId=" + propertyId);
		}

	}

	private void searchProperty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query");
		List<Property> propertyList = propertyDAO.searchProperty(query);
		req.setAttribute("propertyList", propertyList);
		// req.setAttribute("user", user);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
		dispatcher.forward(req, resp);

	}
	
	private void addRecommend(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String message = req.getParameter("message");
        String username = user.getUsername();
        
        
        Recommend recommend = new Recommend(message, user.getId(), username);
        req.setAttribute("addOk", recommendDAO.addRecommendation(recommend));
        showAllList(req, resp);

}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
