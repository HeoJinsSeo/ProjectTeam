package com.study.springboot.test;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
//@Alias("member")
public class MemberDTO {

	
	
	public MemberDTO(String string, String string2, String string3, String string4, String string5, String string6,
			String string7) {
		// TODO Auto-generated constructor stub
	}
	private String memId;
	private String memPw;
	private String memName;
	private String memBirth;
	private String memEmail;
	private String memPhone;
	private String memAges;
	
	
	
	public String getMemId() {
		return memId;
	}



	public MemberDTO setMemId() {
		this.memId = memId;
		return null;
	}



	public String getMemName() {
		return memName;
	}



	public void setMemName(String memName) {
		this.memName = memName;
	}



	public String getMemBirth() {
		return memBirth;
	}



	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}



	public String getMemEmail() {
		return memEmail;
	}



	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}



	public String getMemPhone() {
		return memPhone;
	}



	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}



	public String getMemAges() {
		return memAges;
	}



	public void setMemAges(String memAges) {
		this.memAges = memAges;
	}



	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}



	public String getMemPw() {
		return memPw;
		
	}
	
	
}
