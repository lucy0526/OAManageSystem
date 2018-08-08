package servlet;

import entity.DataGrid;
import entity.Emp;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import com.google.gson.Gson;

import service.EmpService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class EmpServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("flag"));
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String flag = request.getParameter("flag");
		EmpService es = new EmpService();
		if("queryAll".equals(flag)) {
			queryAll(request, response, es);

		}else if("queryByName".equals(flag)) {
			queryByName(request, response, es);
		}else if("edit".equals(flag)) {
			System.out.println("进入EmpServlet中edit，即编辑页面");
			edit(request, response, es);
		}else if("add".equals(flag)) {
			add(request, response, es);
		}else if("del".equals(flag)) {
			del(request, response, es);
		}else if("queryById_modify".equals(flag)) {
			queryById_modify(request, response, es);
		}else if("queryById".equals(flag)){
			queryById(request, response, es);
		}else if("queryByIdtoEdit".equals(flag)) {
			int empId = Integer.parseInt(request.getParameter("id"));
			Emp emp = es.queryEmpById(empId);
			request.setAttribute("emp", emp);
			request.getRequestDispatcher("/jsp/edit.jsp").forward(request, response);
		}else if("queryByPage".equals(flag)) {
			queryByPage(request, response, es);
		}else if("searchempsBy_id".equals(flag)) {
			searchempsBy_id(request, response, es);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	private void searchempsBy_id(HttpServletRequest request,
						  HttpServletResponse response, EmpService es) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		List<Emp> list = new ArrayList<Emp>();
		list.add(es.queryEmpById(id));
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Emp> listPage = new ArrayList<Emp>();
		if((page - 1) * rows + rows > list.size()) {
			listPage = list.subList((page-1)*rows, list.size());
		}else{
			listPage = list.subList((page-1)*rows, (page-1)*rows+rows);
		}
		DataGrid dg = new DataGrid(list.size(),listPage);
		Gson gson = new Gson();
		/*System.out.println(gson.toJson(dg));*/
		PrintWriter out = response.getWriter();
		out.append(gson.toJson(dg));
		out.flush();
		out.close();
	}

	private void queryById(HttpServletRequest request,
			HttpServletResponse response, EmpService es)
			throws ServletException, IOException {
		System.out.println("进入EmpServlet中queryById，即将在员工信息页通过循环显示所有员工的信息");
		int empId = Integer.parseInt(request.getParameter("id"));
		Emp emp = es.queryEmpById(empId);
		request.setAttribute("emp", emp);
		/*Map<String, Emp> map = new HashMap<String, Emp>();
		map.put("emp", emp);
		JSONArray jsonArray = JSONArray.fromObject(map);
		String jsonJAVA = jsonArray.toString();
		//去掉两边的[]
		jsonJAVA = jsonJAVA.substring(1, jsonJAVA.length()-1);
		response.setContentType("textml;charset=UTF-8");
		PrintWriter printWriter = response.getWriter();
		printWriter.write(jsonJAVA);
		printWriter.flush();
		printWriter.close();*/
		System.out.println("---------");
		if("yes".equals(request.getParameter("manage"))){
			request.getRequestDispatcher("/jsp/emp_info.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/jsp/emp_per.jsp").forward(request, response);
		}
	}
	private void queryById_modify(HttpServletRequest request,
			HttpServletResponse response, EmpService es)
	throws ServletException, IOException {
		System.out.println("modify");
		
		int empId = Integer.parseInt(request.getParameter("id"));
		Emp emp = es.queryEmpById(empId);
		request.setAttribute("emp", emp);
		request.getRequestDispatcher("/jsp/emp_info_modify.jsp").forward(request, response);
	}

	private void del(HttpServletRequest request, HttpServletResponse response,
			EmpService es) throws ServletException, IOException {
		System.out.println("============="+request.getParameter("id"));
		
		//将获取的String强转为int
		int empId = Integer.parseInt(request.getParameter("id"));
		String file = request.getSession().getServletContext().getRealPath("/") + "jsp/" + request.getParameter("img");
		File deleteFile = new File(file);
		deleteFile.delete();		//删除文件夹中的文件
		int rows = es.deleteEmpById(empId);	//删除数据库中的数据
		queryByPage(request, response, es);
	}

	private void add(HttpServletRequest request, HttpServletResponse response,
			EmpService es) throws ServletException, IOException {
		String path = request.getSession().getServletContext().getRealPath("images/emp_photo");
		//判断表单是否以多部分内容方式提交
		boolean uploadFlag = ServletFileUpload.isMultipartContent(request);

		String empName = "";
		String password = "";
		int priority = 0;
		int age = 0;
		String gender = "";
		String phone = "";
		String email = "";
		String position = "";
		String photo = "";

		/*int priority = 0;
		String photo = "";
				String empName = request.getParameter("empName");
		String password = request.getParameter("password");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String phone = request.getParameter("empName");
		String email = request.getParameter("phone");
		String position = request.getParameter("position");
		if(request.getParameter("photo")!=null){
			photo = request.getParameter("photo");
		}*/
			
		if(uploadFlag) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload load = new ServletFileUpload(factory);
			try {
				List<FileItem> list = load.parseRequest(request);
				for(FileItem f:list) {
					//判断是否为普通表单字段
					if(f.isFormField()) {
						String fileName = f.getFieldName();
						if("empName".equals(fileName)) {
							empName = f.getString("UTF-8");
						}
						if("password".equals(fileName)&& f.getString()!="") {
							System.out.println("&"+f.getString()+"&");
							password = f.getString("UTF-8");
						}
						if("priority".equals(fileName) && f.getString()!=null) {
							priority = Integer.parseInt(f.getString());
						}
						if("age".equals(fileName) && (f.getString()!="") && (f.getString().trim()!=null)) {
							System.out.println("#"+f.getString()+"#");
							System.out.println(empName);
							age = Integer.parseInt(f.getString());
						}
						if("gender".equals(fileName)) {
							gender = f.getString("UTF-8");
						}
						if("phone".equals(fileName)) {
							phone = f.getString("UTF-8");
						}
						if("email".equals(fileName)) {
							email = f.getString("UTF-8");
						}
						if("position".equals(fileName)) {
							position = f.getString("UTF-8");
						}
					}else {
						String fileName = UUID.randomUUID().toString().replaceAll("-", "")+f.getName().substring(f.getName().lastIndexOf("."));
						//在目标目录中创建文件
						File file = new File(path, fileName);
						//将内容写至新文件
						try {
//							FileUtils.copyFile(f.getString("UTF-8"), file);
							f.write(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
						//拼接上传文件路径
						photo = fileName;
					}
					
				}//of for
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}//of if
		
		Emp emp = new Emp();
		emp.setEmpName(empName);
		emp.setPassword(password);
		emp.setPriority(priority);
		emp.setAge(age);
		emp.setGender(gender);
		emp.setPhone(phone);
		emp.setEmail(email);
		emp.setPosition(position);
		emp.setPhoto(photo);
		
		System.out.println("Emp=="+emp);
		
		int rows = es.insertEmp(emp);
//		queryByPage(request, response, es);
		
		PrintWriter out = response.getWriter();
		out.append("succeed");
		out.flush();
		out.close();
	}

	private void edit(HttpServletRequest request, HttpServletResponse response,
			EmpService es) throws ServletException, IOException {
		/*Emp emp = new Emp();
		int empId = Integer.parseInt(request.getParameter("empId"));
		String empName = request.getParameter("empName");
		String password = request.getParameter("password");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String photo = request.getParameter("photo");
		emp.setEmpId(empId);
		emp.setEmpName(empName);
		emp.setPassword(password);
		emp.setAge(age);
		emp.setGender(gender);
		emp.setPhone(phone);
		emp.setEmail(email);
		emp.setPhoto(photo);
		int rows = es.updateEmpById(emp);
		System.out.println("rows="+rows);
		queryByPage(request, response, es);*/
		
		//上传路径
		String path = request.getSession().getServletContext().getRealPath("images/emp_photo");
		//判断表单是否以多部分内容方式提交
		boolean uploadFlag = ServletFileUpload.isMultipartContent(request);
//		System.out.println("uploadFlag="+uploadFlag);
		
		
		String empName = request.getParameter("empName");
		String password = request.getParameter("password");
		int age = 0;
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String position = request.getParameter("position");
		String photo = request.getParameter("photo");
		int empId = 0;
		
		if(uploadFlag) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload load = new ServletFileUpload(factory);
			try {
				List<FileItem> list = load.parseRequest(request);
				for(FileItem f:list) {
					//判断是否为普通表单字段
					if(f.isFormField()) {
						String fileName = f.getFieldName();
						if("empId".equals(fileName)) {
							empId = Integer.parseInt(f.getString("UTF-8"));
						}else if("empName".equals(fileName)) {
							empName = f.getString("UTF-8");
							System.out.println("empName=" + empName);
						}
						if("password".equals(fileName)) {
							password = f.getString("UTF-8");
						}
						if("age".equals(fileName)) {
							age = Integer.parseInt(f.getString());
						}
						if("gender".equals(fileName)) {
							gender = f.getString("UTF-8");
						}
						if("phone".equals(fileName)) {
							phone = f.getString("UTF-8");
						}
						if("email".equals(fileName)) {
							email = f.getString("UTF-8");
						}
						if("position".equals(fileName)) {
							position = f.getString("UTF-8");
						}
					}else {
						if (f.getName()!="") {
							String fileName = UUID.randomUUID().toString()
									.replaceAll("-", "")
									+ f.getName().substring(
											f.getName().lastIndexOf("."));
							//在目标目录中创建文件
							File file = new File(path, fileName);
							//将内容写至新文件
							try {
								f.write(file);
							} catch (Exception e) {
								System.out.println(photo);
								es.queryEmpById(empId).getPhoto();

							}
							//拼接上传文件路径
							photo = fileName;
						}
					}
					
				}//of for
			} catch (FileUploadException e) {
				System.out.println("photo:"+photo);
				es.queryEmpById(empId).getPhoto();
			}
		}//of if
		Emp emp = new Emp();
		emp.setEmpId(empId);
		emp.setEmpName(empName);
		emp.setPassword(password);
		emp.setAge(age);
		emp.setGender(gender);
		emp.setPhone(phone);
		emp.setEmail(email);
		emp.setPosition(position);
		emp.setPhoto(photo);
		System.out.println(emp);
		int rows = es.updateEmpById(emp);
		request.setAttribute("emp", emp);
//		request.getRequestDispatcher("/jsp/emp_info_modify.jsp").forward(request, response);
//		queryByPage(request, response, es);
	}

	private void queryByName(HttpServletRequest request,
			HttpServletResponse response, EmpService es)
			throws ServletException, IOException {
		String empName = request.getParameter("empName");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}//of if
		int rows = es.queryCount();	//总条数
		//计算总页数
		int pageNum = 0;	
		if(rows % 10 == 0) {	//刚好除尽
			pageNum = rows / 10;
		}else {					//除不尽时
			pageNum = rows / 10 + 1;
		}//of if-else
		//页码的极限值判断
		if(page < 1) {
			page = 1;
		}else if(page > pageNum) {
			page = pageNum;
		}//of if-else
		List<Emp> list = es.queryEmpByName(empName, page);
		request.setAttribute("rows", rows);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/emp_manage.jsp").forward(request, response);
	}

	private void queryAll(HttpServletRequest request,
			HttpServletResponse response, EmpService es) throws IOException {
		List<Emp> list = es.queryAllEmp();
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Emp> listPage = new ArrayList<Emp>();
		if((page - 1) * rows + rows > list.size()) {
			listPage = list.subList((page-1)*rows, list.size());
		}else{
			listPage = list.subList((page-1)*rows, (page-1)*rows+rows);
		}
		DataGrid dg = new DataGrid(list.size(),listPage);
		Gson gson = new Gson();
		/*System.out.println(gson.toJson(dg));*/
		PrintWriter out = response.getWriter();
		out.append(gson.toJson(dg));
		out.flush();
		out.close();
	}
	
	//封装用于根据分页查询的代码(请求转发)
	public void queryByPage(HttpServletRequest request, HttpServletResponse response, EmpService es) throws ServletException, IOException {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}//of if
		int rows = es.queryCount();	//总条数
		int pageNum = 0;	
		//计算总页数
		if(rows % 10 == 0) {	//刚好除尽
			pageNum = rows / 10;
		}else {					//除不尽时
			pageNum = rows / 10 + 1;
		}//of if-else
		//页码的极限值判断
		if(page < 1) {
			page = 1;
		}else if(page > pageNum) {
			page = pageNum;
		}//of if-else
		List<Emp> list = es.queryByPage(page);
		request.setAttribute("rows", rows);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/emp_manage.jsp").forward(request, response);
	}

}
