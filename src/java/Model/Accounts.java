/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author nguye
 */
public class Accounts {
    private String userName,password, isAdmin;

    public Accounts() {
    }

    public Accounts(String userName, String password) {
        this.userName = userName;
        this.password = password;
        this.isAdmin= "0";
    }  
    public Accounts(String userName, String password,String isadmin) {
        this.userName = userName;
        this.password = password;
        this.isAdmin= isadmin;
    } 


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Accounts{" + "userName=" + userName + ", password=" + password + ", isAdmin=" + isAdmin + '}';
    }
    

    
}
