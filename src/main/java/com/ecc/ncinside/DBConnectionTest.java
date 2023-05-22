package com.ecc.ncinside;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnectionTest {
    public static void main(String[] args) throws Exception{
        final String DB_URL = "jdbc:mysql://localhost:3306/NCinside?useUnicode=true&characterEncoding=utf8";
        final String DB_USER = "root";
        final String DB_PASSWORD = "JongWon1408!";
        final String DB_DRIVER = "com.mysql.jdbc.Driver";

//        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//        Statement stmt = conn.createStatement(); // statement생성
//
//        String SQL = "SELECT NOW()";
//        ResultSet rs = stmt.executeQuery(SQL);
//
//        while(rs.next()) {
//            String date = rs.getString(1); //  읽어온 행의 첫번쨰 컬럼을 date에 저장
//            System.out.println(date);
//        }

//        DriverManagerDataSource ds = new DriverManagerDataSource();
//        ds.setDriverClassName(DB_DRIVER);
//        ds.setUrl(DB_URL);
//        ds.setUsername(DB_USER);              // 변경에 불리한 코드 ds를 빈으로 등록해서 쓰자
//        ds.setPassword(DB_PASSWORD);     // 빈으로 쓰기위해 root-context.xml에 클래스 정보 등록

        ApplicationContext ac = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/**/root-context.xml");
        Connection conn = ac.getBean(DataSource.class).getConnection();
        System.out.println("conn = " + conn);
    }
}
