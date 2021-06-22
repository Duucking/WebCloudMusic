package com.duucking.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class PermissionFilter
 */
@WebFilter("/PermissionFilter")
public class PermissionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public PermissionFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 将请求与响应向下转换
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		// 获取访问界面的url文件地址
		String servletPath = req.getServletPath();
		HttpSession session = req.getSession();
		// 获取登录状态
		String flag = (String) session.getAttribute("flag");
		// 判断是否是登录页面、首页、登录Servlet、css、js
		if (servletPath != null && (servletPath.equals("index.jsp") || servletPath.equals("search.jsp")
				|| servletPath.equals("/Index") || servletPath.equals("/Login") || servletPath.equals("/Register")
				|| servletPath.equals("/checkUsername") || servletPath.equals("/Search") || servletPath.contains(".css")
				|| servletPath.contains(".js") || servletPath.equals("/Logout") || servletPath.contains(".jpg")
				|| servletPath.contains(".png") || servletPath.contains(".svg"))) {
			chain.doFilter(request, response);
		} else {
			if (flag != null) {
				if (flag.equals("login_success")) {
					// 登录成功，转发到下一组件
					chain.doFilter(request, response);
				} else {
					// 登录失败，跳转到登首页，并保证网页url路径
					req.setAttribute("Msg", "尚未登录，请登录！");
					req.setAttribute("return_uri", servletPath);
					RequestDispatcher rd = req.getRequestDispatcher("Index");
					rd.forward(req, res);
				}
			} else {
				// 未登录，跳转到首页，并保证网页url路径
				req.setAttribute("Msg", "尚未登录，请登录！");
				req.setAttribute("return_uri", servletPath);
				RequestDispatcher rd = req.getRequestDispatcher("Index");
				rd.forward(req, res);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
