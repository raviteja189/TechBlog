package com.tech.blog.entities;

import java.sql.Timestamp;

public class Posts {

	
	private int pid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private Timestamp pdate;
	
	private int cid;
    private int userid;
	public Posts(int pid, String ptitle, String pcontent, String pcode, Timestamp pdate, int cid, int userid) {
		
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pdate = pdate;
		this.cid = cid;
		this.userid = userid;
	}
	public Posts(String ptitle, String pcontent, String pcode, Timestamp pdate, int cid, int userid) {
		
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pdate = pdate;
		this.cid = cid;
		this.userid = userid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Posts() {
		
	}
		
	
	
}
