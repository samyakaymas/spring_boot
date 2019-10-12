// package com.mobile.mobile.service;

// import com.mobile.mobile.entity.user_roles;
// import com.mobile.mobile.entity.users;
// import com.mobile.mobile.dao.IusersDao;
// import com.mobile.mobile.dao.IroleDao;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.security.core.GrantedAuthority;
// import org.springframework.security.core.authority.SimpleGrantedAuthority;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import org.springframework.security.core.userdetails.UsernameNotFoundException;
// import org.springframework.stereotype.Service;
// import org.springframework.transaction.annotation.Transactional;

// import java.util.HashSet;
// import java.util.Set;

// @Service
// public class UserDetailsServiceImpl implements UserDetailsService{
//     @Autowired
//     private IusersDao userdao;
//     @Autowired
//     private IroleDao roledao;

//     @Override
//     @Transactional(readOnly = true)
//     public UserDetails loadUserByUsername(String username) {
//         users user = userdao.getUserByName(username);
//         if (user == null) throw new UsernameNotFoundException(username);

//         Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
//         for (user_roles role : roledao.getRolesbyUser(user)){
//             grantedAuthorities.add(new SimpleGrantedAuthority(role.getUsername()));
//         }

//         return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
//     }
// }