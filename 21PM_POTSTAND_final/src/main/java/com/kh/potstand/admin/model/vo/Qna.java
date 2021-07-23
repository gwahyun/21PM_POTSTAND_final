package com.kh.potstand.admin.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {
	
	private int qnaNo;
	private String memberId;
	private String qnaSort;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaStatus;
	private Answer answer;

}
