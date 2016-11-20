package org.kilbirdih.service;

import org.kilbirdih.model.User;

import java.util.List;

public interface UserService
{
    void createUser(User user);

    void updateUser(User user);

    void deleteUser(Long id);

    User getUser(Long id);

    List getAllUsers();
}
