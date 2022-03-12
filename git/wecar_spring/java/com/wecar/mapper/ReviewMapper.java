package com.wecar.mapper;

import java.util.List;

import com.wecar.dto.ReserveDto;
import com.wecar.dto.ReviewDto;
import com.wecar.dto.ReviewPagingDto;
import com.wecar.dto.UserDto;

public interface ReviewMapper {
	public List<ReviewDto> list();
	public UserDto writeView(int rno);
	public int write(ReviewDto dto);
	public int state(ReserveDto dto);
	public int delete(ReviewDto dto);
	
	public List<ReviewDto> listPage(ReviewPagingDto dto1);
	public int listSum();
}