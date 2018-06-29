package com.javaex.vo;

public class BoardVo {

	private int no;
	private String title;
	private String name;
	private String content;
	private String reg_date;
	private int group_no;
	private int order_no;
	private int depth;
	public BoardVo(int no, String title, String name, String content, String reg_date, int group_no, int order_no,
			int depth) {
		super();
		this.no = no;
		this.title = title;
		this.name = name;
		this.content = content;
		this.reg_date = reg_date;
		this.group_no = group_no;
		this.order_no = order_no;
		this.depth = depth;
	}
	public BoardVo() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", title=" + title + ", name=" + name + ", content=" + content + ", reg_date="
				+ reg_date + ", group_no=" + group_no + ", order_no=" + order_no + ", depth=" + depth + "]";
	}
	

}
