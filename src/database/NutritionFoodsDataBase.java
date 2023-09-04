package database;


import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;



public class NutritionFoodsDataBase {
	
    String dataBaseUrl;
    String dataBaseUser;
    String dataBasePassword;

    Connection dataBaseConnection;
    
    public Statement dataBaseStatement;

    public void setDataBaseUrl(String url){
        this.dataBaseUrl = url;
    }
    public void setDataBaseUser(String user){
        this.dataBaseUser = user;
    }
    public void setDataBasePassword(String password){
        this.dataBasePassword = password;
    }

    public String getDataBaseUrl(){
        return this.dataBaseUrl;
    }
    public String getDataBaseUser(){
        return this.dataBaseUser;
    }
    public String getDataBasePassword(){
        return this.dataBasePassword;
    }




    public NutritionFoodsDataBase(String[] connectionStringUrlUserPass){
        // check if the lenght is eq 3
        setDataBaseUrl(connectionStringUrlUserPass[0]);
        setDataBaseUser(connectionStringUrlUserPass[1]);
        setDataBasePassword(connectionStringUrlUserPass[2]);

        

    }

    public void createDataBaseConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            this.dataBaseConnection = DriverManager.getConnection(getDataBaseUrl(),getDataBaseUser(),getDataBasePassword());
            this.dataBaseStatement = dataBaseConnection.createStatement();
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    
    public void close() {
    	try {
			dataBaseStatement.close();
			dataBaseConnection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}









































