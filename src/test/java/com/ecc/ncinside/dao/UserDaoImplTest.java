package com.ecc.ncinside.dao;

import com.ecc.ncinside.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;
import java.sql.PreparedStatement;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class UserDaoImplTest {

    final int FAIL = 0;

    @Autowired
    DataSource ds;

    @Autowired
    UserDao userDao;

    @Test
    public void selectUser() {
    }

    @Test
    public void insertUser() {
    }

    @Test
    public void deleteUser() {
    }

    @Test
    public void updateUser() {
        Calendar cal = Calendar.getInstance();
        cal.clear();
        cal.set(2023,2,20);
        userDao.deleteUser("hello4");
        User user = new User("hello4", "1234", "abc", "aaa@aaa.com", new Date(cal.getTimeInMillis()), "facebook", new Date());
        int rowCnt = userDao.insertUser(user);
        assert (rowCnt == 1);
        user.setPwd("4321");
        user.setEmail("hello@hello.com");

        int rowCnt2 = userDao.updateUser(user);
        assert (rowCnt2 == 1);

        User user2 = userDao.selectUser(user.getId());
        System.out.println("user = " + user);
        System.out.println("user2 = " + user2);
        assert (user.equals(user2));
    }
}