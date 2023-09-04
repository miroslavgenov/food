package main;

import java.sql.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

import csv.CsvFoodDataHelper;
import csv.CsvUtil;
import csv.HeaderRanges;
import csv.HeaderRangesUtil;
import database.AminoAcidsTableHelper;
import database.CarbsSugarsTableHelper;
import database.FatsTableHelper;
import database.FoodsTableHelper;
import database.MacronutrientsTableHelper;
import database.MineralsTableHelper;
import database.NutritionComponentsTableHelper;
import database.NutritionFoodsDataBase;
import database.OtherNutritionDataTableHelper;
import database.VitaminsTableHelper;;



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
	
	public static String createInsertValuesQueryForSingleRecord(String table, Integer foreignKeyId, String[] data,HeaderRanges dataRange){
		StringBuilder buildInsertQueary = new StringBuilder();

		int idAutoIncrement=0;
		buildInsertQueary.append("insert into " + table + " values(" + idAutoIncrement + ",");
		
		if(foreignKeyId != null){
			buildInsertQueary.append(foreignKeyId.toString()+",");
		}


		if(dataRange.endRange == -1) {
			dataRange.endRange = data.length;
		}
		
		for(int i = dataRange.startRange; i < dataRange.endRange;i++) {
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
		// if there is no error then you can proceed to get the data and add it to the MySql
		CsvFoodDataHelper csv = new CsvFoodDataHelper("tomatoes");
			
		ArrayList<String> csvDatas = csv.getCsvDatas();
			
		String[] foodNutritionComponentsHeader = csvDatas.get(0).split(",");
		String[] foodNutritionData = csvDatas.get(1).split(",");
		String[] foodNutritionComponentsmeasurementMetrics = csvDatas.get(2).split(",");
		final int foodNutritionComponentsSize = csvDatas.get(0).length();

		final String connectionDataBaseUrl = "jdbc:mysql://localhost:3306/NutritionFoods";
		final String connectionDataBaseUserName = "user";
		final String connectionDataBasePassword = "1";
		
		//TODO: create nutrition components appender because the table is empty
		
		
		NutritionFoodsDataBase dataBase = new NutritionFoodsDataBase(
			new String[]{
				connectionDataBaseUrl,
				connectionDataBaseUserName,
				connectionDataBasePassword
			});
		
		dataBase.createDataBaseConnection();
		
		foodNutritionComponentsHeader = CsvUtil.cleanEmptySpaceAndDashesFrom(foodNutritionComponentsHeader);
		NutritionComponentsTableHelper nutComTH = new NutritionComponentsTableHelper(dataBase.dataBaseStatement);
		nutComTH.createInsertQueryForEachIndexDataFrom(foodNutritionComponentsHeader);
		
//		error in the sql statement
		nutComTH.executeBulkUpdate(csvDatas);
			
		
			
			
		
//		dataBase.close();
		
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			
//			
//			Connection con = DriverManager.getConnection(connectionString,dataBaseUserName,dataBasePassword);
//			Statement stmt = con.createStatement();
//			
//
//			// foods
//			stmt.executeUpdate(createInsertValuesQuery(FoodsTableHelper.TABLE_NAME, null, foodNutritionData, HeaderRangesUtil.begginingHeaderRange));
//			
//			
//			ResultSet resultSet = stmt.executeQuery(String.format("select * from foods where foods.FoodName Like '%s';", foodNutritionData[0]));
//			Integer currentFoodId = getCurrentFoodId(resultSet) ;
//			
//			ArrayList<String> insertDataQuery = new ArrayList<String>(Arrays.asList(
//				createInsertValuesQuery(MacronutrientsTableHelper.TABLE_NAME,currentFoodId,foodNutritionData, HeaderRangesUtil.macronutrientsHeaderRange),
//				createInsertValuesQuery(MineralsTableHelper.TABLE_NAME,currentFoodId,foodNutritionData, HeaderRangesUtil.mineralsHeaderRange),
//				createInsertValuesQuery(VitaminsTableHelper.TABLE_NAME, currentFoodId, foodNutritionData, HeaderRangesUtil.vitaminsHeaderRange),
//				createInsertValuesQuery(OtherNutritionDataTableHelper.TABLE_NAME, currentFoodId, foodNutritionData, HeaderRangesUtil.otherNutritionRange),
//				createInsertValuesQuery(CarbsSugarsTableHelper.TABLE_NAME, currentFoodId, foodNutritionData, HeaderRangesUtil.carbsSugarsRange),
//				createInsertValuesQuery(FatsTableHelper.TABLE_NAME, currentFoodId, foodNutritionData, HeaderRangesUtil.fatsRange),
//				createInsertValuesQuery(AminoAcidsTableHelper.TABLE_NAME, currentFoodId, foodNutritionData, HeaderRangesUtil.aminoAcidsRange)
//			));
//
//			for(String query : insertDataQuery){
//				stmt.executeUpdate(query);
//			}
//			
//
//			
//		} catch (Exception e) {
//			System.out.println(e);
//			
//		}
		
		
	}

}