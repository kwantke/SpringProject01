package com.freehoon.u4.home.dao;

import com.freehoon.u4.home.vo.UserInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.freehoon.u4.home.dao.UserInfoDAO.";

    public UserInfoVO selectUserInfo(String userId) {
        return sqlSession.selectOne(NAMESPACE + "selectUserInfo",userId);
    };

}
