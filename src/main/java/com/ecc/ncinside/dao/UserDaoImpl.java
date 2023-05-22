package com.ecc.ncinside.dao;

import com.ecc.ncinside.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    DataSource ds;

    final int FAIL = 0;

    @Override
    public User selectUser(String id) {
        User user = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String SQL = "SELECT * FROM user_info WHERE id = ?";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);

            rs = pstmt.executeQuery();

            if(rs.next()) {
                user = new User();
                user.setId(rs.getString(1));
                user.setPwd(rs.getString(2));
                user.setName(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setBirth(new Date(rs.getDate(5).getTime()));
                user.setSns(rs.getString(6));
                user.setReg_date(new Date(rs.getTimestamp(7).getTime())); // getTiemstamp getTime
            }
        }catch (SQLException e) {
            return null;
        }finally {
            try { if(rs!=null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if(pstmt!=null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if(conn!=null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }

        }
        return user;
//        try (
//                Connection conn = ds.getConnection();
//                PreparedStatement pstmt = conn.prepareStatement(SQL);
//
//                ResultSet rs = pstmt.executeQuery();
//        ) {
//
//            if (rs.next()) {
//                User user = new User();
//                user.setId(rs.getString(1));
//                user.setPwd(rs.getString(2));
//                user.setName(rs.getString(3));
//                user.setEmail(rs.getString(4));
//                user.setBirth(new Date(rs.getDate(5).getTime()));
//                user.setSns(rs.getString(6));
//                user.setReg_date(new Date(rs.getTimestamp(7).getTime())); // getTiemstamp getTime
//                return user;
//            }
//            return null;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
    }

    @Override
    public int insertUser(User user) {
        int rowCnt = FAIL;


        String SQL = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?, ?,NOW())";
        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SQL);
        ) {
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPwd());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getEmail());
            pstmt.setDate(5, new java.sql.Date(user.getBirth().getTime()));
            pstmt.setString(6, user.getSns());
            System.out.println("user = " + user);

            return pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
            return FAIL;
        }
    }

    @Override
    public int deleteUser(String id) {

        String SQL = "DELETE FROM user_info WHERE id = ?";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SQL);
        ){
            pstmt.setString(1, id);
            return pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
            return FAIL;
        }
    }

    @Override
    public int updateUser(User user) {
        int rowCnt = FAIL;

        String SQL = "UPDATE user_info " +
                "SET pwd = ?, name = ?, email = ?, birth = ?, sns = ?, reg_date = ? " +
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
        }catch (SQLException e) {
            e.printStackTrace();
            return FAIL;
        }
        return rowCnt;
    }

    @Override
    public int count() throws Exception {
        String SQL = "SELECT COUNT(*) FROM user_info";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                ResultSet rs = pstmt.executeQuery()
        ) {
            rs.next();
            int result = rs.getInt(1);

            return result;
        }
    }

    @Override
    public void deleteAll() throws Exception {
        try (
                Connection conn = ds.getConnection();
        ) {
            String SQL = "DELETE FROM user_info";
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.executeUpdate();
        }
    }
}
