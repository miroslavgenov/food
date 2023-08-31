package csv;

import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;

public class CsvFoodDataHelper {
    String pathWithFoodFolders= "/home/user/Desktop/nutrientFood/";
    String csvDataFileName = "main.csv";
    String csvDataFilePath;

    String foodFolderName;
    ArrayList<String> csvDatas;

    File csvDataFile = null;

    Scanner readCsvDataFileScanner;
    
    public CsvFoodDataHelper(String foodFolderName){
        setFoodFolderName(foodFolderName);

        if(new File(getPathWithFoodFolders()+getFoodFolderName()).exists() == false){
            System.out.println("Food folder doesn't exists");
        }else{
            // if food folder exists then do the rest here
            setCsvDataFilePath(buildDataFilePath());
            
            // check if the main.csv exists
            csvDataFile = new File(getCsvDataFilePath());
            if(csvDataFile.exists() && csvDataFile.isFile()){                
                try{
                    initializeCsvDatas();

                    readCsvDataFileScanner = new Scanner(getCsvDataFile());

                    while(readCsvDataFileScanner.hasNext()){
                        csvDatas.add(readCsvDataFileScanner.nextLine());
                    }

                }catch(Exception e){
                    System.out.println(e);
                }

            }else{
                System.out.println("The main.csv doesn't exists");
            }

        }
    }
    
    File getCsvDataFile(){
        return this.csvDataFile;
    }

    String buildDataFilePath(){
        StringBuilder dataFilePathBuilder = new StringBuilder();

        dataFilePathBuilder.append(getPathWithFoodFolders());
        dataFilePathBuilder.append(getFoodFolderName());
        dataFilePathBuilder.append("/");
        dataFilePathBuilder.append(getCsvDataFileName());

        return dataFilePathBuilder.toString();
    }

    void setCsvDataFilePath(String csvDataFilePath){
        this.csvDataFilePath = csvDataFilePath;
    }

    String getCsvDataFilePath(){
        return this.csvDataFilePath;
    }

    String getPathWithFoodFolders(){
        return this.pathWithFoodFolders;
    }

    String getCsvDataFileName(){
        return this.csvDataFileName;
    }


    void setFoodFolderName(String foodFolderName){
        this.foodFolderName = foodFolderName;
    }

    String getFoodFolderName(){
        return this.foodFolderName;
    }


    void initializeCsvDatas(){
        this.csvDatas = new ArrayList<String>();
    }

    public ArrayList<String> getCsvDatas(){
        return this.csvDatas;
    }
}
