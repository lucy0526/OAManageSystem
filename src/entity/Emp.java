package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Emp entity. @author MyEclipse Persistence Tools
 */

public class Emp implements java.io.Serializable {

	// Fields

	private Integer empId;
	private Wage wage;
	private String empName;
	private String password;
	private Integer priority;
	private Integer age;
	private String gender;
	private String phone;
	private String email;
	private String position;
	private String photo;

	private Set empMessages = new HashSet(0);
	private Set overtimes = new HashSet(0);
	private Set wages = new HashSet(0);
	private Set attendances = new HashSet(0);

	// Constructors

	/** default constructor */
	public Emp() {
	}

	/** minimal constructor */
	public Emp(String empName, String password, Integer priority,
			String position) {
		this.empName = empName;
		this.password = password;
		this.priority = priority;
		this.position = position;
	}

	/** full constructor */
	public Emp(Wage wage, String empName, String password, Integer priority,
			Integer age, String gender, String phone, String email,
			String position, String photo, Set empMessages, Set overtimes, Set wages,
			Set attendances) {
		this.wage = wage;
		this.empName = empName;
		this.password = password;
		this.priority = priority;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.position = position;
		this.photo = photo;
		this.empMessages = empMessages;
		this.overtimes = overtimes;
		this.wages = wages;
		this.attendances = attendances;
	}

	// Property accessors

	public Integer getEmpId() {
		return this.empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public Wage getWage() {
		return this.wage;
	}

	public void setWage(Wage wage) {
		wage.setEmp(this);
		this.wage = wage;
	}

	public String getEmpName() {
		return this.empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Set getEmpMessages() {
		return this.empMessages;
	}

	public void setEmpMessages(Set empMessages) {
		this.empMessages = empMessages;
	}

	public Set getOvertimes() {
		return this.overtimes;
	}

	public void setOvertimes(Set overtimes) {
		this.overtimes = overtimes;
	}

	public Set getWages() {
		return this.wages;
	}

	public void setWages(Set wages) {
		this.wages = wages;
	}

	public Set getAttendances() {
		return this.attendances;
	}

	public void setAttendances(Set attendances) {
		this.attendances = attendances;
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Emp [age=" + age + ", attendances=" + attendances + ", email="
				+ email + ", empId=" + empId + ", empMessages=" + empMessages
				+ ", empName=" + empName + ", gender=" + gender
				+ ", overtimes=" + overtimes + ", password=" + password
				+ ", phone=" + phone + ", photo=" + photo + ", position="
				+ position + ", priority=" + priority + ", wage=" + wage
				+ ", wages=" + wages + "]";
	}
	
}