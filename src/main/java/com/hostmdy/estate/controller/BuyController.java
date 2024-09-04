package com.hostmdy.estate.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.estate.model.Buy;
import com.hostmdy.estate.model.BuyDAO;
import com.hostmdy.estate.model.Mode;
import com.hostmdy.estate.model.Property;

import com.hostmdy.estate.model.User;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buy")
public class BuyController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/estate_app")
    private DataSource dataSource;

    private BuyDAO buyDAO;
  
 

    @Override
    public void init() throws ServletException {
        buyDAO = new BuyDAO(dataSource);
      
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String param = req.getParameter("mode");
        Mode mode = null;

        if (param == null) {
            mode = Mode.LISTBUY;
        } else {
            mode = Mode.valueOf(param);
        }

        switch (mode) {
            case LISTBUY:
                listBuyByUser(req, resp);
                break;
            case ADD:
                addBuy(req, resp);
                break;
            case PENDING:
            	listPendingBuys(req, resp);
            	break;
            case APPROVE:
            	approveBuy(req, resp);
            	break;
            case DECLINE:
            	declineBuy(req, resp);
            	break;
            case LIST_SOLD:
            	listAllSoldProperties(req, resp);
            	break;
            case APPROVED_BUY:
            	ListApprovedBuyProperties(req, resp);
            	break;
            case DECLINED_BUY:
            	ListDeclinedBuyProperties(req, resp);
            	break;
          
            default:
                listBuyByUser(req, resp);
                break;
        }
    }
   

    private void ListApprovedBuyProperties(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Buy> approvedBuy = buyDAO.getBuyByApproved();
		req.setAttribute("approvedBuy", approvedBuy);
        RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-dashboard.jsp?view=buy-list");
        dispatcher.forward(req, resp);
	}
    
    private void ListDeclinedBuyProperties(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Buy> declinedBuy = buyDAO.getBuyByDeclined();
		req.setAttribute("declinedBuy", declinedBuy);
        RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-dashboard.jsp?view=cancel-list");
        dispatcher.forward(req, resp);
	}

	private void listBuyByUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser != null) {
            List<Property> buy = buyDAO.getBuyByUser(currentUser.getId());
            req.setAttribute("buy", buy);
            RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/user-buyList.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("template/index.jsp");
        }
    }
    
    
    private void listAllSoldProperties(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Property> soldProperties = buyDAO.getAllSoldProperties();
        req.setAttribute("soldProperties", soldProperties);
        RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-dashboard.jsp?view=sold-list");
        dispatcher.forward(req, resp);
    }
   


    private void addBuy(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");
        String propertyIdString = req.getParameter("propertyId");
        String username = currentUser.getUsername();
        
        if (currentUser != null && propertyIdString != null && !propertyIdString.isEmpty()) {
            Long propertyId = Long.parseLong(propertyIdString);
            Buy buy = new Buy(currentUser.getId(), username, propertyId, LocalDateTime.now(), "PENDING");

            
            req.setAttribute("insertOk", buyDAO.addBuy(buy));
        	System.out.println("Buy added successfully.");
        	RequestDispatcher dispatcher = req.getRequestDispatcher("property?mode=SINGLE&propertyId=" + propertyId);
        	 dispatcher.forward(req, resp);
           // resp.sendRedirect("property?mode=SINGLE&propertyId=" + propertyId);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().println("ERROR!!! User or Property ID is missing");
        }
    }

   

    private void approveBuy(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buyIdString = req.getParameter("buyId");
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (buyIdString != null && !buyIdString.isEmpty() && currentUser != null) {
            Long buyId = Long.parseLong(buyIdString);
            String approvedBy = currentUser.getUsername();
            buyDAO.approveBuy(buyId, approvedBy);
            resp.sendRedirect("buy?mode=PENDING");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("ERROR!!! Buy ID or User is missing.");
        }
    }

    private void declineBuy(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buyIdString = req.getParameter("buyId");
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (buyIdString != null && !buyIdString.isEmpty() && currentUser != null) {
            Long buyId = Long.parseLong(buyIdString);
            String declinedBy = currentUser.getUsername();
            buyDAO.declineBuy(buyId, declinedBy);
            resp.sendRedirect("buy?mode=PENDING");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("ERROR!!! Buy ID or User is missing.");
        }
    }



    private void listPendingBuys(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Buy> pendingBuys = buyDAO.getPendingBuys();
        req.setAttribute("pendingBuys", pendingBuys);
        RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/agent-dashboard.jsp?view=pending-list");
        dispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
