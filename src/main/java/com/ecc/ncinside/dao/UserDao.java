package com.ecc.ncinside.dao;

import com.ecc.ncinside.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

public interface UserDao {
    User selectUser(String id);
    int insertUser(User user);
    int deleteUser(String id);
    int updateUser(User user);

    int count() throws Exception;

    void deleteAll() throws Exception;
    
}
