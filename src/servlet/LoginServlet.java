package servlet;

import entity.Emp;
import service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLDecoder;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进来啦，这是doGet");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("kk");
		//登录输入时才能输入中文
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	
		System.out.println("进来啦，这是post");
		
		String name = request.getParameter("empName");
		//System.out.println(name);
		String password = request.getParameter("password");
		//System.out.println(password);
		
		//完成自动登录(把数据从cookie中取出来)
		if(name == null && password == null) {
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie:cookies) {
				if("empName".equals(cookie.getName())) {
					name = URLDecoder.decode(cookie.getValue(),"UTF-8");//存值不存name
				}//of ifcookie.getValue()
				if("password".equals(cookie.getName())) {
					password = URLDecoder.decode(cookie.getValue(),"UTF-8");
				}//of if
			}//of foreach
			
			System.out.println("cookie.getValue()="+name);
			System.out.println("cookie.getValue()="+password);
			
			LoginService ls = new LoginService();
			Emp emp = ls.login(name, password);
			System.out.println(emp.getEmpName());
			if(emp.getEmpName() != null) {
				//将当前登录信息放到session当中
				HttpSession session = request.getSession();
				session.setAttribute("empName", emp.getEmpName());//有默认时效（半小时）
				session.setMaxInactiveInterval(30*60);//可自设session时效，单位是秒s
				System.out.println("自动登录成功");
				request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
			}else {
				//重定位，回到登录界面
				System.out.println("自动登录，重定位");
				response.sendRedirect("/jsp/loginUI.jsp");	//客户端跳转
			}//of if-else
		}else {		//完成手动登录
			LoginService ls = new LoginService();
			Emp emp = ls.login(name, password);
			if(emp.getEmpName() != null) {
				//可将当前登录信息放到session当中
				HttpSession session = request.getSession();
				session.setAttribute("empName", emp.getEmpName());//有默认时效（半小时）
				session.setMaxInactiveInterval(30*60);//可自设session时效，单位是秒s
				
				session.setAttribute("emp", emp);
				
				/*片面地将servlet看作服务器
				 *把用户名和密码都放到cookie当中，再一起回到客户端
				*/
				Cookie nameCookie = new Cookie("empName", emp.getEmpName());
				Cookie pwdCookie = new Cookie("password", emp.getPassword());
				nameCookie.setMaxAge(60*60);//cookie也要设置时效，单位是秒s；cookie没有remove，设置为0即失效；设置为-1是浏览器关闭就失效
				nameCookie.setPath("/");//设置读取的路径,"/"即根目录下所有文件
				pwdCookie.setMaxAge(60*60);
				pwdCookie.setPath("/");
				response.addCookie(nameCookie);
				response.addCookie(pwdCookie);		
				
				request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
			}else {
				//重定位，回到登录界面
				request.setAttribute("error", "用户名或密码错误！");
				//response.sendRedirect("jsp/loginUI.jsp");	//客户端跳转
				request.getRequestDispatcher("jsp/loginUI.jsp").forward(request, response);
			}//of if-else
		}//of if-else
	}
}
