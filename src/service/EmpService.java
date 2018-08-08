package service;

import dao.EmpDao;
import entity.Emp;

import java.util.List;

public class EmpService {
	EmpDao ed = new EmpDao();
	
	//����Ա��
	public int insertEmp(Emp emp) {
		return ed.insertEmp(emp);
	}
	
	//���idɾ��Ա��
	public int deleteEmpById(int empId) {
		return ed.deleteEmpById(empId);
	}
		
	//���id�޸�Ա����Ϣ
	public int updateEmpById(Emp emp) {
		return ed.updateEmpById(emp);
	}
	
	//��ѯ����Ա��
	public List<Emp> queryAllEmp(){
		return ed.queryAllEmp();
	}
	
	//����û����ѯԱ����ģ���ѯ��
	public List<Emp> queryEmpByName(String empName, int page){
		return ed.queryEmpByName(empName, page);
	}

	//���id��ѯ�û�
	public Emp queryEmpById(int empId) {
		return ed.queryEmpById(empId);
	}
	
	//��ѯ������(ģ���ѯ)
	public int queryCountByName(String empName){
		return ed.queryCountByName(empName);
	}
	
	//���ҳ���ѯ�û�
	public List<Emp> queryByPage(int page){
		return ed.queryByPage(page);
	}
	
	//��ѯ������
	public int queryCount() {
		return ed.queryCount();
	}
	public Emp queryEmpName(String name )
	{
		return ed.queryEmpName(name);
	}
}
	