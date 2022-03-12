package com.wecar.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReviewPagingDto {
	private int pageTotal;
	private int onePageLimit;
	private int pageAll;
	private int bottomlist;
	private int startButton;
	private int endButton;
	private int currentButton;
	private List<ReviewDto> list10;
	private int pstartno;
	private int uno;
}