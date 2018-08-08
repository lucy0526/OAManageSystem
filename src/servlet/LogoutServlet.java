package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.removeAttribute("empName");
		Cookie nameCookie = new Cookie("empName", null);
		Cookie pwdCookie = new Cookie("password", null);
		nameCookie.setMaxAge(0);
		nameCookie.setPath("/");
		pwdCookie.setMaxAge(0);
		pwdCookie.setPath("/");
		response.addCookie(nameCookie);
		response.addCookie(pwdCookie);
		System.out.println("退出成功！");
		response.sendRedirect("jsp/loginUI.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入dopost啦");
	}
}
