package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import service.NoticeService;
import util.JsonReader;
import entity.Notice;

public class NoticeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		getNewNotice(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String flag = request.getParameter("flag");
		
		if(flag.equals("add")){
			addNotice(request, response);
		}
	}

	public void getNewNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService ns = new NoticeService();
		Notice notice = ns.selectNewNotice();
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("jsp/notice.jsp").forward(request, response);
	}
	public void addNotice(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html;charset=utf-8");

		/** 设置响应头允许ajax跨域访问 **/
		response.setHeader("Access-Control-Allow-Origin", "*");
		/* 星号表示所有的异域请求都可以接受， */
		response.setHeader("Access-Control-Allow-Methods", "GET,POST");
		NoticeService ns = new NoticeService();
		JSONObject json=JsonReader.receivePost(request);
		System.out.println(json);
		
		Notice notice = (Notice)JSONObject.toBean(json,Notice.class);
		System.out.println(notice.getContent());
		java.util.Date ddDate = new java.util.Date();
		Date date = new Date(ddDate.getTime());
		/*notice.setContent(notice.getContent());
		notice.setNotice_source(notice.getNotice_source());
		notice.setNotice_type(notice.getNotice_type());
		notice.setTitle(notice.getTitle());*/
		notice.setDate(date);
		ns.addNotice(notice);
	}

}
