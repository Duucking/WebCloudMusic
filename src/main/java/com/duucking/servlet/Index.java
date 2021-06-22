package com.duucking.servlet;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duucking.model.*;
import com.duucking.util.DaoFactory;

@WebServlet(name = "Index", urlPatterns = { "/Index" })
public class Index extends HttpServlet {

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
		HttpSession session=request.getSession();
		String UID = (String) session.getAttribute("UID");
		String avator = (String) session.getAttribute("avator");
		String Msg = (String) request.getAttribute("Msg");
		List<Music> musiclisttop8 = new ArrayList<>();
		List<Music> musiclistnew10 = new ArrayList<>();
		musiclisttop8 = DaoFactory.MusicDao().getMusicList(null, null, "top8");
		musiclistnew10 = DaoFactory.MusicDao().getMusicList(null, null, "new10");

		request.setAttribute("musiclisttop8", musiclisttop8);
		request.setAttribute("musiclistnew10", musiclistnew10);
		request.setAttribute("UID", UID);
		request.setAttribute("avator", avator);
		
		request.setAttribute("Msg", Msg);

		request.getRequestDispatcher("index.jsp").forward(request, response);

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
