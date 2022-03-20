package com.freehoon.u4.home.service;

import com.freehoon.u4.home.dao.UserInfoDAO;
import com.freehoon.u4.home.vo.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService{

    @Autowired
    private UserInfoDAO userInfoDAO;

    @Override
    public UserInfoVO selectUserInfo() {
        return userInfoDAO.selectUserInfo("kkk");
    }

    @Override
    public String test() {
        return null;
    }
}
