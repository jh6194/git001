package com.wecar.dto;

import java.util.ArrayList;

import com.wecar.dao.PagingDao;

public class UserPagingDto {
	private int pageTotal;
	private int onePageLimit;
	private int pageAll;
	private int bottomlist;
	private int startBtn;
	private int endBtn;
	private int currentBtn;
	private ArrayList<WDto> list10;
	private int pstartno;

	public UserPagingDto() {
		super();
	}

	public UserPagingDto(int pstartno) {
		PagingDao dao = new PagingDao();
		this.pageTotal = dao.userlistSum();	// 전체 레코드수
		this.onePageLimit = 20;	// 한페이지당 보여주는 레코드
		this.pageAll = (int) Math.ceil(pageTotal/(float)onePageLimit);	// 전체 페이지수
		this.bottomlist = 10;	// 하단 네비게이션
		this.pstartno = pstartno;	// 현재보여줄 db시작번호
		this.list10 = dao.userlistpage(pstartno);	// 현재보여줄 페이지 글 개수
		// <이전		1(0~9)		2(10~19)	3(20~29) ..10(90~99) 다음>
		// <이전 11(100~109)	12(110~119)	13(120~129) .. 20(190~199) 다음>
		this.currentBtn = (int) Math.ceil((pstartno + 2)/(float) onePageLimit);
		// 시작 11(현재번호 11~20)	마지막 20
		// 시작  1(현재번호 1~10)	마지막 10
		this.startBtn = ((int) Math.floor((this.currentBtn-1)/(float)this.bottomlist)) * bottomlist + 1;
		this.endBtn = this.startBtn + bottomlist-1;	//끝버튼
		if (this.pageAll < this.endBtn) {this.endBtn = this.pageAll;}
	}

	public UserPagingDto(int pageTotal, int onePageLimit, int pageAll, int bottomlist, int startBtn, int endBtn,
			int currentBtn, ArrayList<WDto> list10, int pstartno) {
		super();
		this.pageTotal = pageTotal;
		this.onePageLimit = onePageLimit;
		this.pageAll = pageAll;
		this.bottomlist = bottomlist;
		this.startBtn = startBtn;
		this.endBtn = endBtn;
		this.currentBtn = currentBtn;
		this.list10 = list10;
		this.pstartno = pstartno;
	}

	public int getpageTotal() {
		return pageTotal;
	}

	public void setpageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getOnePageLimit() {
		return onePageLimit;
	}

	public void setOnePageLimit(int onePageLimit) {
		this.onePageLimit = onePageLimit;
	}

	public int getPageAll() {
		return pageAll;
	}

	public void setPageAll(int pageAll) {
		this.pageAll = pageAll;
	}

	public int getBottomlist() {
		return bottomlist;
	}

	public void setBottomlist(int bottomlist) {
		this.bottomlist = bottomlist;
	}

	public int getStartBtn() {
		return startBtn;
	}

	public void setStartBtn(int startBtn) {
		this.startBtn = startBtn;
	}

	public int getEndBtn() {
		return endBtn;
	}

	public void setEndBtn(int endBtn) {
		this.endBtn = endBtn;
	}

	public int getCurrentBtn() {
		return currentBtn;
	}

	public void setCurrentBtn(int currentBtn) {
		this.currentBtn = currentBtn;
	}

	public ArrayList<WDto> getList10() {
		return list10;
	}

	public void setList10(ArrayList<WDto> list10) {
		this.list10 = list10;
	}

	public int getPstartno() {
		return pstartno;
	}

	public void setPstartno(int pstartno) {
		this.pstartno = pstartno;
	}
}
