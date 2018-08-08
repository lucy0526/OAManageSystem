package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Attendanceservice;

import com.google.gson.Gson;

import entity.Attendance;
import entity.DataGrid;

public class AttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("进入doGet,servlet?flag=" + request.getParameter("flag"));
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		Attendanceservice attendanceservice = new Attendanceservice();
		String flag = request.getParameter("flag");

		
		System.out.println("===========111");
		if("queryallUserbytime".equals(flag))
		{
			System.out.println("===========");
			List<Attendance> list = attendanceservice.queryallUserbytime() ;
			
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			System.out.println("page:"+page);
			
			List<Attendance> listPage = new ArrayList<Attendance>();
			
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

	}

	private void attList(HttpServletRequest request,
			HttpServletResponse response, Attendanceservice attendanceservice)
			throws IOException {
		List<Attendance> list = attendanceservice.queryallUserbytime() ;
		
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		System.out.println(list.size());
		List<Attendance> listPage = new ArrayList<Attendance>();
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
		request.getRequestDispatcher("jsp/attendant.jsp").forward(request, response);*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Attendanceservice attendanceservice=new Attendanceservice();
		String flag = request.getParameter("flag");
		if("queryallUserbyid".equals(flag))
		{  
			Integer id=Integer.parseInt(request.getParameter("username"));
			
			List<Attendance> list =attendanceservice.queryallUserbyid(id);
			System.out.println(list.size());
			request.setAttribute("list", list);
			request.getRequestDispatcher("jsp/attendant.jsp").forward(request, response);
			
		}
		else if("sign".equals(flag))
		{
			Integer id = Integer.parseInt(request.getParameter("id"));
			System.out.println("empid=" + id);
			try {
				int rows = attendanceservice.sign(id);
				PrintWriter out = response.getWriter();
				out.append("succeed");
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			} 
			//request.getRequestDispatcher("jsp/attendant.jsp").forward(request, response);
		}

		else if("leave".equals(flag))
		{
			Integer id=Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			try {
				int rows = attendanceservice.leave(id);
				PrintWriter out = response.getWriter();
				out.append("succeed");
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			//request.getRequestDispatcher("jsp/attendant.jsp").forward(request, response);
		}

		doGet(request, response);
	}
}
