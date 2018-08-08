package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import service.EmpMessageIdService;
import service.EmpService;
import service.MessageService;
import util.JsonReader;
import entity.Emp;
import entity.Message;

public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get");
		System.out.println(request.getParameter("flag"));
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String flag = request.getParameter("flag");
		if("selectByPage".equals(flag)){
			selectByPage(request, response);
		}else if("selectAll".equals(flag)){
			selectAll(request, response);
		}else if("selectByNoticeId".equals(flag)){
			selectByNoticeId(request,response);
		}else if("selectByEmpId".equals(flag)){
			selectByEmpId(request, response);
		}else if("add".equals(flag))
			MessageAdd(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void selectByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MessageService ms = new MessageService();
		int counts = ms.selectCounts();
		int page = 1;
		if(request.getParameter("page")!=null)
			page = Integer.parseInt(request.getParameter("page"));
		if(page<1)
			page = 1;
		else if(page > counts)
			page = counts;
		Message message = ms.selectByPage(page);
		request.setAttribute("message", message);
		request.setAttribute("page", page);
		request.setAttribute("pageNum", counts);
		request.getRequestDispatcher("jsp/messageUI.jsp").forward(request, response);
	}

	public void selectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		MessageService ms = new MessageService();
		List<Message> list  = ms.selectAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/message.jsp").forward(request, response);
	}
	public void selectByNoticeId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		MessageService ms = new MessageService();
		Message message = ms.selectById(Integer.parseInt(request.getParameter("id")));
		System.out.println(message.getTitle());
		request.setAttribute("message", message);
		ms.updateIsreadById(Integer.parseInt(request.getParameter("id")));
		request.getRequestDispatcher("jsp/messageUI.jsp").forward(request, response);
	}
	public void MessageAdd(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {

		response.setContentType("text/html;charset=utf-8");

		/** 设置响应头允许ajax跨域访问 **/
		response.setHeader("Access-Control-Allow-Origin", "*");
		/* 星号表示所有的异域请求都可以接受， */
		response.setHeader("Access-Control-Allow-Methods", "GET,POST");
		MessageService ms = new MessageService();
		EmpService es = new EmpService();
		
		EmpMessageIdService eis = new EmpMessageIdService();
		
		JSONObject json=JsonReader.receivePost(request);
		System.out.println(json);
		Emp emp = es.queryEmpName(json.getString("accepter"));
		Message message= (Message)JSONObject.toBean(json,Message.class);
		java.util.Date ddDate = new java.util.Date();
		Date date = new Date(ddDate.getTime());
		message.setDate(date);
		ms.addMessage(message);
		message = ms.selectBytitle(message.getTitle());
		if(eis.addEmpMessageId(emp, message)==0)
			System.out.println("insert error !");
	}

	public void selectByEmpId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		MessageService ms = new MessageService();
		System.out.println(Integer.parseInt(request.getParameter("id")));
		int id = Integer.parseInt(request.getParameter("id"));
		List<Message> list = ms.selectByEmpId(id);
		request.setAttribute("list", list);
		System.out.println("==========="+list.size());
		request.getRequestDispatcher("jsp/message.jsp").forward(request, response);
	}

}
