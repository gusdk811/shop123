package com.hot.shop.question.model.service;


import java.util.ArrayList;

import com.hot.shop.question.model.vo.QuestionPhoto;
import com.hot.shop.question.model.vo.QuestionUser;

public interface QuestionService {

	ArrayList<QuestionUser> selectUserQuestionList();//1:1문의 리스트(유저)
	
	QuestionUser QuestionUserWrite();//1:1문의 글쓰기(유저 페이지)

	int insertUserWrite(QuestionUser qUser);//1:1 문의 글쓰기(유저 실질적인 백단)

	int insertWriteFile(QuestionPhoto qp);

	

}
