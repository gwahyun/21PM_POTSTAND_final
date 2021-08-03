package com.kh.potstand.db.settings;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SortSetting {
	
	@Autowired
	SqlSession session;
	
	
	@RequestMapping("/dbpage")
	public String dbpage(){
		return "temp/temp";
	}
	
	
	@RequestMapping("/db/sortSetting.do")
	public ModelAndView sortSetting(ModelAndView mv, HttpServletRequest request) throws Exception{
		int result=0;
		

		//Context Root
		String path = request.getSession().getServletContext().getRealPath("/"); 
		
		//path = path.substring(0,path.lastIndexOf("target"));
		File category = new File("C:\\Users\\Jang\\git\\21PM_POTSTAND_final\\21PM_POTSTAND_final\\src\\main\\webapp\\temp\\category.txt");

		
		
		BufferedReader br = new BufferedReader(new FileReader(category));
		BufferedReader br2 = new BufferedReader(new FileReader(category));
		String line="";
		
		
		//category Lv별 분류
		Map<String,String> lv1 = new HashMap();
		Map<String,String> lv2 = new HashMap();
		Map<String,String> lv3 = new HashMap();
		Map<String,String> lv4 = new HashMap();
		while((line=br.readLine())!=null) {
			String[] arr = line.split(":");
			arr[0] = arr[0].trim();
			arr[1] = arr[1].trim();
			switch(arr[0].length()) {
				case 3: lv1.put(arr[0], arr[1]); 
						break;
				case 6: arr[0]=arr[0].substring(0,6);
						lv2.put(arr[0], arr[1]); 
						break;
				case 9: arr[0]=arr[0].substring(0,9);
						lv3.put(arr[0], arr[1]); 
						break;
				case 12: lv4.put(arr[0], arr[1]); 
						 break;
			}
		}
		br.close();
		
		//sql문 실행할 값 넘겨주기
		while((line=br2.readLine())!=null) {
			String[] arr = line.split(":");
			arr[0] = arr[0].trim();
			arr[1] = arr[1].trim();
			Map<String,String> param = new HashMap();
			String lv1Value;
			String lv2Value;
			String lv3Value;
			String lv4Value;
			switch(arr[0].length()) {
				case 3: lv1Value = lv1.get(arr[0]);
						param.put("sortNo", arr[0]);
						param.put("lv1", lv1Value);
						session.insert("function.insertSort",param);
						break;
				case 6: lv1Value = lv1.get(arr[0].substring(0, 3));
						lv2Value = lv2.get(arr[0]);
						param.put("sortNo", arr[0]);
						param.put("lv1", lv1Value);
						param.put("lv2", lv2Value);
						session.insert("function.insertSort",param);
						break;
				case 9: lv1Value = lv1.get(arr[0].substring(0, 3));
						lv2Value = lv2.get(arr[0].substring(0, 6));
						lv3Value = lv3.get(arr[0]);
						param.put("sortNo", arr[0]);
						param.put("lv1", lv1Value);
						param.put("lv2", lv2Value);
						param.put("lv3", lv3Value);
						session.insert("function.insertSort",param);
						break;
				case 12:lv1Value = lv1.get(arr[0].substring(0, 3));
						lv2Value = lv2.get(arr[0].substring(0, 6));
						lv3Value = lv3.get(arr[0].substring(0, 9));
						lv4Value = lv4.get(arr[0]);
						param.put("sortNo", arr[0]);
						param.put("lv1", lv1Value);
						param.put("lv2", lv2Value);
						param.put("lv3", lv3Value);
						param.put("lv4", lv4Value);
						session.insert("function.insertSort",param);
						break;
			}
		}
		br2.close();
		mv.addObject("msg","성공.");
		mv.addObject("loc","/dbpage");
		mv.setViewName("common/msg");
		return mv;
	}
	

}

