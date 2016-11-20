package org.kilbirdih.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "user")
public class User implements Serializable
{
    private static final long serialVersionUID = -5527566248002296042L;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "name")
    private String name;
    @Column(name = "age")
    private int age;
    @Column(name = "isAdmin")
    private boolean admin;
    @Column(name = "createDate")
    private Date createDate;

    public User()
    {
        admin = false;
        createDate = new Date();
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public long getId()
    {
        return id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public int getAge()
    {
        return age;
    }

    public void setAge(int age)
    {
        this.age = age;
    }

    public boolean isAdmin()
    {
        return admin;
    }

    public void setAdmin(boolean isAdmin)
    {
        this.admin = isAdmin;
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }
}
