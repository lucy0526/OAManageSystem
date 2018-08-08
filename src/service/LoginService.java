package service;

import dao.LoginDao;
import entity.Emp;

public class LoginService {
	//µÇÂ¼·½·¨
	public Emp login(String empName, String password) {
		LoginDao ld = new LoginDao();
		return ld.Login(empName, password);
	}
}
