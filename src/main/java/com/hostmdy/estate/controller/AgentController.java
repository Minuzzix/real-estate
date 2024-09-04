package com.hostmdy.estate.controller;

import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.estate.model.Mode;


import com.hostmdy.estate.model.User;
import com.hostmdy.estate.model.UserDAO;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/agent")
public class AgentController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/estate_app")
	private DataSource dataSource;
	
	private UserDAO userDAO;
	
	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO(dataSource);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String param = req.getParameter("mode");
		System.out.println("Param in User Controller is"+param);
		Mode mode = null;

		if (param == null) {
			mode = Mode.LIST;
		} else {
			mode = Mode.valueOf(param);
		}

		switch (mode) {
		case LIST:
			showUserList(req, resp);
			break;
		case ENABLE:
			enableUser(req, resp);
			break;
		case DISABLE:
			disableUser(req, resp);
			break;
		 case BAN:
             banUser(req, resp);
             break;
		
		default:
			showUserList(req, resp);
			break;
		}
	}

	

	private void enableUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long userId = Long.parseLong(req.getParameter("userId"));
		boolean ok = userDAO.enableUser(userId);
		showUserList(req, resp);
		
	}
	
	private void disableUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long userId = Long.parseLong(req.getParameter("userId"));
		boolean ok = userDAO.disableUser(userId);
		showUserList(req, resp);
		
	}
	

	private void showUserList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> userList = userDAO.getAllUsers(); 
		req.setAttribute("userList", userList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-dashboard.jsp?view=user-list");
		dispatcher.forward(req, resp);
	}
	
	
	private void banUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    Long userId = Long.parseLong(req.getParameter("userId"));

	    String ban_Minutes = req.getParameter("banMinutes");
	    int banMinutes = 0;

	    if (ban_Minutes != null && !ban_Minutes.isEmpty()) {
	        try {
	            banMinutes = Integer.parseInt(ban_Minutes);
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	            req.setAttribute("error", "Invalid ban.");
	            showUserList(req, resp);
	            return;
	        }
	    }

	    userDAO.banUser(userId, banMinutes);
	    showUserList(req, resp);
	}

	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
