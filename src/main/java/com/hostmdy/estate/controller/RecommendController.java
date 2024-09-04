//package com.hostmdy.estate.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.sql.DataSource;
//
//import com.hostmdy.estate.model.RecommendDAO;
//import com.hostmdy.estate.model.User;
//import com.hostmdy.estate.model.Mode;
//import com.hostmdy.estate.model.Recommend;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/recommend")
//public class RecommendController extends HttpServlet{
//
//	/**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//	
//	@Resource(name = "jdbc/estate_app")
//	private DataSource dataSource;
//	
//	private RecommendDAO recommendDAO;
//	
//	@Override
//	public void init() throws ServletException {
//		recommendDAO = new RecommendDAO(dataSource);
//	}
//	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String param = req.getParameter("mode");
//		Mode mode = null;
//		
//		if(param == null) {
//			mode = Mode.VIEW_RECOMMEND;
//		}else {
//			mode = Mode.valueOf(param);
//		}
//		
//		switch (mode) {
//		case VIEW_RECOMMEND:
//			showRecommend(req, resp);
//			break;
//		case ADD_RECOMMEND:
//			addRecommend(req, resp);
//			break;
//			
//		default:
//			showRecommend(req, resp);
//			break;
//			
//		}
//	}
//	
//
//	
//	 private void addRecommend(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	      
//	            HttpSession session = req.getSession();
//	            User user = (User) session.getAttribute("user");
//	            String message = req.getParameter("message");
//	            
//	            
//	            Recommend recommend = new Recommend(message, user.getId());
//	            req.setAttribute("addOk", recommendDAO.addRecommendation(recommend));
//	            showRecommend(req, resp);
//	   
//	    }
//
//	    private void showRecommend(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	        List<Recommend> recommendations = recommendDAO.getRecommendations();
//	        req.setAttribute("recommendations", recommendations);
//	        RequestDispatcher dispatcher = req.getRequestDispatcher("template/index.jsp");
//	        dispatcher.forward(req, resp);
//	    }
//
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(req, resp);
//	}
//
//}
