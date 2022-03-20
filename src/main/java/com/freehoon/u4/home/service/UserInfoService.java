package com.freehoon.u4.home.service;

import com.freehoon.u4.home.vo.UserInfoVO;
import org.springframework.stereotype.Service;

@Service
public interface UserInfoService {

    public UserInfoVO selectUserInfo();

    public String test();
}
