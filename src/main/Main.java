package main;

import java.sql.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

class HeaderRanges{
	public int startRange;
	public int endRange;
	
	public HeaderRanges(int startRange, int endRange) {
		this.startRange = startRange;
		this.endRange = endRange;
	}
}

public class Main {
	
	public static <T> boolean canValueBeInteger(T value) {
		try {
			Integer.parseInt((String) value);
			
		} catch (NumberFormatException e) {
			return false;
		}
		
		return true;
	}

	public static <T> boolean canValueBeDouble(T value) {
		try {
			Double.parseDouble((String) value);
			
		} catch (NumberFormatException e) {
			return false;
		}
		
		return true;
	}
	
	
	public static void shouldAddComma(StringBuilder query,int index, int lenght) {
		if(index < lenght - 1) {
			query.append(",");
		}
	}
	
	public static String createInsertValuesQuery(String table, Integer foreignKeyId, String[] data,HeaderRanges dataRange){
		StringBuilder buildInsertQueary = new StringBuilder();

		int idAutoIncrement=0;
		buildInsertQueary.append("insert into " + table + " values(" + idAutoIncrement + ",");
		
		if(foreignKeyId != null){
			buildInsertQueary.append(foreignKeyId.toString()+",");
		}


		
		for(int i = dataRange.startRange; i<dataRange.endRange;i++) {
			if(canValueBeInteger(data[i])) {
				buildInsertQueary.append(data[i]);
				
			}else if(canValueBeDouble(data[i])){
				buildInsertQueary.append(data[i]);
				
			}else if(data[i].equals("null")){
				buildInsertQueary.append(data[i]);
			}
			else {
				
				buildInsertQueary.append("\"" + data[i] + "\"");
			}
			
			shouldAddComma(buildInsertQueary,i,dataRange.endRange);
		}	
		buildInsertQueary.append(");");
	
		return buildInsertQueary.toString();
	}	

	public static Integer getCurrentFoodId(ResultSet resultSet){
		int currentFoodId = 0;

		try{

			while(resultSet.next()) {
				currentFoodId = resultSet.getInt("id");
			}

			return currentFoodId;

		}catch(Exception e){System.out.println(e);}

		return null;
	}

	public static void main(String[] args) {
		
//		code that gets the data and fill it into the data base
		
		File bananaCsv = new File("banana/main.csv");
		
		ArrayList<String> bananaData = new ArrayList<String>();
		
		if(bananaCsv.exists()) {
			try {
				Scanner bananaCsvScanner = new Scanner(bananaCsv);
				
				while(bananaCsvScanner.hasNextLine()) {
					bananaData.add(bananaCsvScanner.nextLine());
				}
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("File doesn't exists!");
		}
		
		
		String[] foodNutritionComponentsHeader = bananaData.get(0).split(",");
		String[] foodNutritionData = bananaData.get(1).split(",");
		String[] foodNutritionComponentsmeasurementMetrics = bananaData.get(2).split(",");
		final int foodNutritionComponentsSize = foodNutritionComponentsHeader.length;
		
		
		HeaderRanges begginingHeaderRange = new HeaderRanges(0, 2);
		HeaderRanges macronutrientsHeaderRange = new HeaderRanges(2, 12);
		HeaderRanges mineralsHeaderRange = new HeaderRanges(12, 27);
		HeaderRanges vitaminsHeaderRange = new HeaderRanges(27, 56);
		HeaderRanges otherNutritionRange = new HeaderRanges(56, 62);
		HeaderRanges carbsSugarsRange = new HeaderRanges(62, 74);
		HeaderRanges fatsRange = new HeaderRanges(74, 137);
		HeaderRanges aminoAcidsRange = new HeaderRanges(137, foodNutritionComponentsSize);

		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/NutritionFoods","user","1");
			Statement stmt = con.createStatement();
			
			System.out.println("inserting records");

			// foods
			stmt.executeUpdate(createInsertValuesQuery("foods",null,foodNutritionData, begginingHeaderRange));
			
			
			ResultSet resultSet = stmt.executeQuery(String.format("select * from foods where foods.FoodName Like '%s';", foodNutritionData[0]));
			Integer currentFoodId = getCurrentFoodId(resultSet) ;
			
			ArrayList<String> insertDataQuery = new ArrayList<String>(Arrays.asList(
				createInsertValuesQuery("macronutrients",currentFoodId,foodNutritionData, macronutrientsHeaderRange),
				createInsertValuesQuery("minerals",currentFoodId,foodNutritionData, mineralsHeaderRange),
				createInsertValuesQuery("vitamins", currentFoodId, foodNutritionData, vitaminsHeaderRange),
				createInsertValuesQuery("otherNutritionData", currentFoodId, foodNutritionData, otherNutritionRange),
				createInsertValuesQuery("carbsSugars", currentFoodId, foodNutritionData, carbsSugarsRange),
				createInsertValuesQuery("fats", currentFoodId, foodNutritionData, fatsRange),
				createInsertValuesQuery("aminoAcids", currentFoodId, foodNutritionData, aminoAcidsRange)
			));

			for(String query : insertDataQuery){
				stmt.executeUpdate(query);
			}
			

			
		} catch (Exception e) {
			System.out.println(e);
			
		}
		
		
	}

}












































