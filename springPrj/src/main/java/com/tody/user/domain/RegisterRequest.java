package com.tody.user.domain;

public class RegisterRequest {
	
	private String ID;
	private String PASSWORD;
	private String chkPASSWORD;
	private String NAME;
	private String EMAIL;
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
