package com.duucking.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duucking.model.*;
import com.duucking.util.DaoFactory;

@WebServlet(name = "Search", urlPatterns = { "/Search" })
public class Search extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String UID = (String) request.getAttribute("UID");
		String avator = (String) request.getAttribute("avator");
		String Msg = (String) request.getAttribute("Msg");
		String searchtext = request.getParameter("searchtext");
		List<Music> musiclist = new ArrayList<>();
		musiclist = DaoFactory.MusicDao().getMusicList(searchtext, null, "search");
		if (musiclist != null) {
			request.setAttribute("musiclist", musiclist);
			request.setAttribute("UID", UID);
			request.setAttribute("avator", avator);
			request.setAttribute("searchtext", searchtext);
			request.setAttribute("Msg", Msg);
		} else {
			request.setAttribute("UID", UID);
			request.setAttribute("avator", avator);
			request.setAttribute("Msg", Msg);
		}
		request.getRequestDispatcher("search.jsp").forward(request, response);

		// 1.页面转发 携带请求数据 地址栏不会发生变化
//        request.getRequestDispatcher("index.jsp").forward(request, response);
		// 2.页面重定向 不能携带数据 地址栏会发生变化

//        response.sendRedirect("index.jsp");

	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
