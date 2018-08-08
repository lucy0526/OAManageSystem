package entity;

import java.util.Date;

import sun.net.www.content.text.plain;

/**
 * Overtime entity. @author MyEclipse Persistence Tools
 */

public class Overtime implements java.io.Serializable {

	// Fields

	private Integer overtimeId;
	private Integer misstimeId;
    private String name;   

	private Integer time;
	private Date date;

	// Constructors

	/** default constructor */
	public Overtime() {
	}

	/** full constructor */
	public Overtime( Integer time, Date date) {
	
		this.time = time;
		this.date = date;
	}

	// Property accessors

	public Integer getOvertimeId() {
		return this.overtimeId;
	}

	public void setOvertimeId(Integer overtimeId) {
		this.overtimeId = overtimeId;
	}
	public Integer getmisstimeId() {
		return this.misstimeId;
	}

	public void setmisstimeId(Integer misstimeId) {
		this.misstimeId = misstimeId;
	}

	public Integer getTime() {
		return this.time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public Date getDate() {
	
	
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
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