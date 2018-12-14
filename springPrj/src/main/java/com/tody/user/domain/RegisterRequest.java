package com.tody.user.domain;

import javax.persistence.Entity;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Entity
public class RegisterRequest {
	
	@NotEmpty
	@Pattern(regexp="\\w{4,8}")
	private String ID;
	
	@NotEmpty
	private String PASSWORD;
	
	@NotEmpty
	private String chkPASSWORD;
	
	@NotEmpty
	@Pattern(regexp="\\S{2,8}")
	private String NAME;

	@Email
	private String EMAIL;
	
	@Pattern(regexp="^\\d{3}-\\d{3,4}-\\d{4}$")
	private String PHONE;
	
	public boolean isPwEqualToCheckPw() {
		return PASSWORD.equals(chkPASSWORD);
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getChkPASSWORD() {
		return chkPASSWORD;
	}
	public void setChkPASSWORD(String chkPASSWORD) {
		this.chkPASSWORD = chkPASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

}
