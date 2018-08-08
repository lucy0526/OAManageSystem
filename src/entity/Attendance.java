package entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Attendance entity. @author MyEclipse Persistence Tools
 */

public class Attendance implements java.io.Serializable {

	// Fields

	private Integer attId;
	private Emp emp;
	private Object startdate;
	
	private Object enddate;
	private Integer emp_id;
	private String name;
	 public Attendance(Integer attId, Date startdate, Date enddate)
	{
		super();
		this.attId=attId;
		this.enddate=enddate;
		this.startdate=startdate;
		
	}
	

	// Constructors

	/** default constructor 
	 * @throws ParseException */
	public Attendance() throws ParseException 
	{    SimpleDateFormat df = new SimpleDateFormat("MM-dd HH:mm:ss");
		  startdate= df.parse("00-00 00:00:00");
		   enddate=df.parse("00-00 00:00:00");
	}

	/** full constructor */
	

	// Property accessors

	public Integer getAttId() {
		return this.attId;
	}

	public Attendance(Integer attId, Emp emp, Date startdate, Date enddate,Integer emp_id) {
		super();
		this.attId = attId;
		this.emp = emp;
		this.startdate = startdate;
		this.enddate = enddate;
		this.emp.setEmpId(emp_id);
	}
	
	public Attendance(Emp emp, Date startdate, Date enddate) {
		super();
		this.emp = emp;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public Date gettime() //��ȡʱ��
	{
		Date date = new Date();    
         date.getTime();
         return date;
        
	}
	
	
	public Object getStartdate() {
		
		return startdate;
	}

	public void setStartdate(Object startdate) {
		this.startdate = startdate;
	}

	public Object getEnddate() {
		return enddate;
	}

	public void setEnddate(Object object) {
		this.enddate = object;
	}

	public void setAttId(Integer attId) {
		this.attId = attId;
	}

	public Integer getEmpid() {
		return this.emp_id;
	}

	public void setEmpId(Integer emp) {
		this.emp_id = emp;
	}
    public void setname(String name)
   {
	 this.name=name;
	 
    }
    public String getname()
    {
	 return this.name;
	 
   }
 
}