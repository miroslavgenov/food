package database;

import java.sql.Statement;
import java.util.ArrayList;

public class NutritionComponentsTableHelper extends TableHelper {
	
	Statement st = null;
	
	public NutritionComponentsTableHelper(Statement st) {
		super("nutritionComponents");
		
		this.st = st;
		
		
	}
	
	public void executeBulkUpdate(ArrayList<String> queries) {
		for(String x : queries) {
			try {
				st.executeUpdate(x);
			}catch(Exception e) {
				System.out.println(e);
			}
		}
	}
	
	public ArrayList<String> createInsertQueryForEachIndexDataFrom(String[] data) {
		
		ArrayList<String> sqlQueries = new ArrayList<String>();
		
		for(int i=0;i<data.length;i++) {
			String sqlQuery = String.format("insert into %s values(%d,\"%s\");", TABLE_NAME, ID_AUTO_INCREMENT, data[i]);
			sqlQueries.add(sqlQuery);
		}
		
		return sqlQueries;
	}
}

























