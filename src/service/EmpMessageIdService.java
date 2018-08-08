package service;

import dao.EmpMessageIdDao;
import entity.Emp;
import entity.Message;

public class EmpMessageIdService {
	EmpMessageIdDao edao = new EmpMessageIdDao();
	public int  addEmpMessageId(Emp emp,Message message) {
		return edao.addEmpMessageId(emp, message);
	}
}
