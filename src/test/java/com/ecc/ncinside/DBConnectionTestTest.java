package com.ecc.ncinside;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import javax.validation.constraints.AssertTrue;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class DBConnectionTestTest {

    final int FAIL = 0;

    @Autowired
    DataSource ds;

    @Test
    public void updateUserTest() throws Exception {
        deleteUser("hello2");
        User user = new User("hello2", "dnflwlq1408", "jongwon", "whddnjs3340@naver.com", new java.util.Date(), "instagram", new java.util.Date());
        int rowCnt = intsertUser(user);
        assert (rowCnt == 1);

        User user2 = selectUser("hello2");
        assert (user2.getPwd().equals("dnflwlq1408"));
        System.out.println("user2 = " + user2);
    }

    public int updateUser(User user) throws Exception {
        int rowCnt = FAIL;

        String SQL = "UPDATE user_info" +
                "SET pwd = ?, name = ?, email = ?, birth = ?, sns = ?, reg_date = ?" +
                "WHERE id = ? ";

        // try-with-resources
        try (
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
        ){
            pstmt.setString(1, user.getPwd());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            pstmt.setDate(4, new java.sql.Date(user.getBirth().getTime()));
            pstmt.setString(5, user.getSns());
            pstmt.setTimestamp(6, new java.sql.Timestamp(user.getReg_date().getTime()));
            pstmt.setString(7, user.getId());

            rowCnt = pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
            return FAIL;
        }

        return rowCnt;
    }

    @Test
    public void selectUserTest() throws Exception {
        User user1 = new User("hello1", "dnflwlq1408", "jongwon", "whddnjs3340@naver.com", new java.util.Date(), "instagram", new java.util.Date());
        intsertUser(user1);
        User user2 = selectUser("hello1");
        System.out.println(user2);
        assert (user2.getId().equals("hello1"));
    }

    public User selectUser(String id) throws Exception {
        Connection conn = ds.getConnection();
        String SQL = "SELECT * FROM user_info WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(SQL);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();


        if(rs.next()) {
            User user = new User();
            user.setId(rs.getString(1));
            user.setPwd(rs.getString(2));
            user.setName(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setBirth(rs.getDate(5));
            user.setSns(rs.getString(6));
            user.setReg_date(new Date(rs.getTimestamp(7).getTime())); // getTiemstamp getTime
            return user;
        }
        return null;
    }

    @Test
    public void deleteUserTest() throws Exception {
        int rowCnt = deleteUser("hello1");
        assert (rowCnt == 1);
//        User user = new User("hello", "dnflwlq1408", "jongwon", "whddnjs3340@naver.com", new java.util.Date(), "instagram", new java.util.Date());
//        rowCnt = intsertUser(user);
//        assert (rowCnt == 1);

    }

    public int deleteUser(String id) throws Exception {
        Connection conn = ds.getConnection();
        String SQL = "DELETE FROM user_info WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(SQL);
        pstmt.setString(1,id);
        int rowCnt = pstmt.executeUpdate();
        return rowCnt;
    }

    public int intsertUser(User user) throws Exception {
        deleteUser("hello1");
        Connection conn = ds.getConnection();
        String SQL = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?, ?,NOW())";
        PreparedStatement pstmt = conn.prepareStatement(SQL);

        pstmt.setString(1, user.getId());
        pstmt.setString(2, user.getPwd());
        pstmt.setString(3, user.getName());
        pstmt.setString(4, user.getEmail());
        pstmt.setDate(5, new java.sql.Date(user.getBirth().getTime()));
        pstmt.setString(6, user.getSns());

        System.out.println(new java.sql.Date(user.getBirth().getTime()).toString());


        int rowCnt = pstmt.executeUpdate();
        return rowCnt;
    }

    @Test
    public void insertUserTest() throws Exception {
        User user = new User("hello1", "dnflwlq1408", "jongwon", "whddnjs3340@naver.com", new java.util.Date(), "instagram", new java.util.Date());
        System.out.println("user = " + user);
        int rowCnt = intsertUser(user);
        assert(rowCnt == 1);
    }

    @Test
    public void main() throws Exception {
//        ApplicationContext ac = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/**/root-context.xml");
        Connection conn = ds.getConnection();

        System.out.println("conn = " + conn);

        assert (conn != null);
    }
}