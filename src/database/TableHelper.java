package database;

public class TableHelper {
	public static final int ID_AUTO_INCREMENT = 0;
	public static String TABLE_NAME;
	
	public TableHelper(String tableName) {
		setTableName(tableName);
	}
	
	public void setTableName(String tableName) {
		this.TABLE_NAME = tableName;
	}
	
	
}
