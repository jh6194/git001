package com.wecar.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wecar.dto.UserDto;
import com.wecar.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserMapper mapper;
	
	@Override
	public UserDto userSelect(UserDto dto) { return mapper.userSelect(dto); }	
}
