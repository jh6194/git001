package com.wecar.service.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wecar.dto.ReserveDto;
import com.wecar.dto.ReviewDto;
import com.wecar.dto.ReviewPagingDto;
import com.wecar.dto.UserDto;
import com.wecar.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewMapper mapper;

	@Transactional @Override public List<ReviewDto> list() { return mapper.list(); }
	@Transactional @Override public UserDto writeView(int rno) { return mapper.writeView(rno); }
	@Transactional @Override public int write(ReviewDto dto) { return mapper.write(dto); }
	@Transactional @Override public int state(ReserveDto dto) { return mapper.state(dto); }
	@Transactional @Override public int delete(ReviewDto dto) { return mapper.delete(dto); }
	@Transactional @Override public List<ReviewDto> listPage(ReviewPagingDto dto1) { return mapper.listPage(dto1); }
	@Transactional @Override public int listSum() { return mapper.listSum(); }
}