package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Wage entity. @author MyEclipse Persistence Tools
 */

public class Wage implements java.io.Serializable {

	// Fields

	private Integer wageId;
	private Emp emp;
	private Integer baseWage;
	private Integer deductWage;
	private Integer addWage;
	private Integer totalWage;
	private Set emps = new HashSet(0);

	// Constructors

	/** default constructor */
	public Wage() {
	}

	/** minimal constructor */
	public Wage(Emp emp) {
		this.emp = emp;
	}

	/** full constructor */
	public Wage(Emp emp, Integer baseWage, Integer deductWage, Integer addWage,
			Integer totalWage, Set emps) {
		this.emp = emp;
		this.baseWage = baseWage;
		this.deductWage = deductWage;
		this.addWage = addWage;
		this.totalWage = totalWage;
		this.emps = emps;
	}

	// Property accessors

	public Integer getWageId() {
		return this.wageId;
	}

	public void setWageId(Integer wageId) {
		this.wageId = wageId;
	}

	public Emp getEmp() {
		return this.emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Integer getBaseWage() {
		return this.baseWage;
	}

	public void setBaseWage(Integer baseWage) {
		this.baseWage = baseWage;
	}

	public Integer getDeductWage() {
		return this.deductWage;
	}

	public void setDeductWage(Integer deductWage) {
		this.deductWage = deductWage;
	}

	public Integer getAddWage() {
		return this.addWage;
	}

	public void setAddWage(Integer addWage) {
		this.addWage = addWage;
	}

	public Integer getTotalWage() {
		return this.totalWage;
	}

	public void setTotalWage(Integer totalWage) {
		this.totalWage = totalWage;
	}

	public Set getEmps() {
		return this.emps;
	}

	public void setEmps(Set emps) {
		this.emps = emps;
	}

}