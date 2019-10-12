// package com.mobile.mobile.service;

// import com.mobile.mobile.entity.users;
// import com.mobile.mobile.dao.IusersDao;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.stereotype.Service;


// @Service
// public class UserServiceImpl implements UserService {
//     @Autowired
//     private IusersDao userdao;

//     @Autowired
//     private BCryptPasswordEncoder bCryptPasswordEncoder;

//     @Override
//     public void insert(users user) {
//         user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
//         userdao.insert(user);
//     }

//     @Override
//     public users findByUsername(String username) {
//         return userdao.getUserByName(username);
//     }
// }