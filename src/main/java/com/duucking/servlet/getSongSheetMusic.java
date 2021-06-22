package com.duucking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.duucking.model.Music;
import com.duucking.util.DaoFactory;

@WebServlet("/getSongSheetMusic")
public class getSongSheetMusic extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String USSID = request.getParameter("USSID");
		List<Music> musiclist = new ArrayList<>();
		JSONArray jsonArray = new JSONArray();
		musiclist = DaoFactory.UserSongSheetMusicDao().getSheetMusicList(USSID);
		for (Music music : musiclist) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("mid", music.getMID());
			jsonObject.put("name", music.getName());
			if (music.getArtist() != null) {
				jsonObject.put("artist", music.getArtist());
			} else {
				jsonObject.put("artist", music.getBand());
			}
			jsonObject.put("url", music.getFileSource());
			if (music.getAlbum().getName() != null) {
				jsonObject.put("album", music.getAlbum().getName());
			} else {
				jsonObject.put("album", "");
			}
			jsonObject.put("cover", music.getCoverFile());
			jsonArray.add(jsonObject);
		}

		out.write(jsonArray.toJSONString());

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
