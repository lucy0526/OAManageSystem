package servlet;

import com.google.gson.Gson;
import entity.DataGrid;
import entity.Overtime;
import net.sf.json.JSONObject;
import service.workservice;
import util.JsonReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class Wservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Wservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		workservice workservice=new workservice();
		String flag = request.getParameter("flag");
		System.out.println("进入doGet, Wservlet?flag="+flag);

		if("queryalluserbytime_over".equals(flag))
		{
			List<Overtime> list = workservice.queryalloveruserbytime();
			System.out.println("list.size():" + list.size());

			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			List<Overtime> listPage = new ArrayList<Overtime>();
			if((page - 1) * rows + rows > list.size()) {
				listPage = list.subList((page-1)*rows, list.size());
			}else{
				listPage = list.subList((page-1)*rows, (page-1)*rows+rows);
			}

			DataGrid dg = new DataGrid(list.size(),listPage);
			Gson gson = new Gson();
			String json = gson.toJson(dg);
			System.out.println(json);
			PrintWriter out = response.getWriter();
			out.append(json);
			out.flush();
			out.close();

			/*request.setAttribute("list", list);
			request.setAttribute("lists", lists);
			request.getRequestDispatcher("jsp/work_manage.jsp").forward(request, response);*/
		}else if("queryalluserbytime_miss".equals(flag)){
			List<Overtime> list = workservice.queryallmissuserbytime();
			System.out.println("lists.size()" + list.size());

			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			List<Overtime> listPage = new ArrayList<Overtime>();
			if((page - 1) * rows + rows > list.size()) {
				listPage = list.subList((page-1)*rows, list.size());
			}else{
				listPage = list.subList((page-1)*rows, (page-1)*rows+rows);
			}

			DataGrid dg = new DataGrid(list.size(),listPage);
			Gson gson = new Gson();
			String json = gson.toJson(dg);
			System.out.println(json);
			PrintWriter out = response.getWriter();
			out.append(json);
			out.flush();
			out.close();
		}
		if("overtimebyid".equals(flag))
		{
			Integer id=Integer.parseInt(request.getParameter("username"));
			List<Overtime> list =workservice.queryalloveruserbyid(5);
			List<Overtime> lists =workservice.queryallmissuserbytime();
			System.out.println(list.size());
			System.out.println(lists.size());
			request.setAttribute("list", list);
			request.setAttribute("lists", lists);
			request.getRequestDispatcher("jsp/work_manage.jsp").forward(request, response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
	     workservice workservice=new workservice();
		String flag = request.getParameter("flag");
		if("overtimebyid".equals(flag))
		{
			Integer id=Integer.parseInt(request.getParameter("username"));
			System.out.println(id);
			List<Overtime> list =workservice.queryalloveruserbyid(id);
			List<Overtime> lists =workservice.queryallmissuserbytime();
			System.out.println(list.size());
			System.out.println(lists.size());
			request.setAttribute("list", list);
			request.setAttribute("lists", lists);
			request.getRequestDispatcher("jsp/work_manage.jsp").forward(request, response);
			
		}
		if("misstimebyid".equals(flag))
		{
			Integer id=Integer.parseInt(request.getParameter("username"));
			System.out.println(id);
			List<Overtime> list =workservice.queryalloveruserbytime();
			List<Overtime> lists =workservice.queryallmissuserbyid(id);
			System.out.println(list.size());
			System.out.println(lists.size());
			request.setAttribute("list", list);
			request.setAttribute("lists", lists);
			request.getRequestDispatcher("jsp/work_manage.jsp").forward(request, response);
			
		}
		else if("addovertime".equals(flag))
		{
			JSONObject json=JsonReader.receivePost(request);
			System.out.println(json);
			String name="";
			Integer id=Integer.parseInt(json.getString("id"));
			Integer time=Integer.parseInt(json.getString("time"));
			String date=json.getString("date");
			
			workservice.addtime(id, name, time, date, 1);
			/*PrintWriter out = response.getWriter();
			out.append("succeed");
			out.flush();
			out.close();*/
			
			//request.getRequestDispatcher("jsp/work_manage.jsp").forward(request, response);

		}else if("addleavetime".equals(flag))
		{
			JSONObject json=JsonReader.receivePost(request);
			System.out.println(json);
			
			Integer id=Integer.parseInt(json.getString("id"));
			Integer time=Integer.parseInt(json.getString("time"));
			String date=json.getString("date");
			String name="";
			workservice.addtime(id, name, time, date, 2);
			/*PrintWriter out = response.getWriter();
			out.append("succeed");
			out.flush();
			out.close();*/
	          /*request.getRequestDispatcher("jsp/work_manage.jsp").forward(request, response);*/
		}
		doGet(request, response);
	}
}
