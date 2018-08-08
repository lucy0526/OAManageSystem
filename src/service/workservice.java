package service;

import java.util.List;

import dao.WorkDao;
import entity.Overtime;

public class workservice {
	public List<Overtime> queryalloveruserbyid(Integer id)
	{
		WorkDao workDao=new WorkDao();
		return workDao.queryalloveruserbyid(id);
		
	}
	public List<Overtime> queryallmissuserbyid(Integer id)
	{
		WorkDao workDao=new WorkDao();
		return workDao.queryallmissuserbyid(id);
		
	}
	public List<Overtime> queryalloveruserbytime()
	{
		WorkDao workDao=new WorkDao();
		return workDao.queryalloveruserbytime();
		
		
	}
	public List<Overtime> queryallmissuserbytime()
	{
		WorkDao workDao=new WorkDao();
		return workDao.queryallmissuserbytime();
		
		
	}
	public void addtime(Integer id,String name,Integer time,Object date,int type)
	{
		
		WorkDao workDao=new WorkDao();
		workDao.addtime(id, name, time, date, type);
		
	}
}
