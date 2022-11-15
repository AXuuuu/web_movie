package movie.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class User {
    private int id;
    private String username;
    private String useraccount;
    private String usersex;
    private String userage;
    private String userpassword;
    private String usertell;
    private String useraddress;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username", nullable = true, length = 255)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "useraccount", nullable = true, length = 255)
    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount;
    }

    @Basic
    @Column(name = "usersex", nullable = true, length = 255)
    public String getUsersex() {
        return usersex;
    }

    public void setUsersex(String usersex) {
        this.usersex = usersex;
    }

    @Basic
    @Column(name = "userage", nullable = true, length = 255)
    public String getUserage() {
        return userage;
    }

    public void setUserage(String userage) {
        this.userage = userage;
    }

    @Basic
    @Column(name = "userpassword", nullable = true, length = 255)
    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    @Basic
    @Column(name = "usertell", nullable = true, length = 255)
    public String getUsertell() {
        return usertell;
    }

    public void setUsertell(String usertell) {
        this.usertell = usertell;
    }

    @Basic
    @Column(name = "useraddress", nullable = true, length = 255)
    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id && Objects.equals(username, user.username) && Objects.equals(useraccount, user.useraccount) && Objects.equals(usersex, user.usersex) && Objects.equals(userage, user.userage) && Objects.equals(userpassword, user.userpassword) && Objects.equals(usertell, user.usertell) && Objects.equals(useraddress, user.useraddress);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, useraccount, usersex, userage, userpassword, usertell, useraddress);
    }
}
