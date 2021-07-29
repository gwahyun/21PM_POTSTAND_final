package com.kh.potstand.admin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Genretest {

	
	public static void main(String[] args) {
		try{
			String path = Genretest.class.getResource("/").getPath();
            File file = new File(path+"/text.txt");
            FileReader filereader = new FileReader(file);
            BufferedReader bufReader = new BufferedReader(filereader);
            String line = "";
            List<String> categoryNo = new ArrayList();
            while((line = bufReader.readLine()) != null){
            	categoryNo.add(line);
                System.out.println(line);
            }
            System.out.println(categoryNo);
            bufReader.close();
        }catch (FileNotFoundException e) {
        	e.printStackTrace();
        }catch(IOException e){
            System.out.println(e);
        }


	}
}
