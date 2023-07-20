package com.poseidon.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	//첫화면 로딩 : index.jsp호출
	@GetMapping(value = { "/", "/index" })
	public String index() {
		return "index"; //데이터 붙임 없이 index.jsp페이지만 보여줍니다.
	}
	//임시로 만들었어요. 나중에 수정하겠습니다.ㅁㅅㅁ
	@GetMapping("/board2")
	public String menu() {
		return "board2";
	}
	//임시로 만들었어요. 나중에 수정하겠습니다.ㅁㅅㅁ	
	@GetMapping("/mooni")
	public String mooni() {
		return "mooni";
	}
	//임시로 만들었어요. 나중에 수정하겠습니다.ㅁㅅㅁ
	@GetMapping("/notice")
	public String notice() {
		return "notice";
	}
	
	
	
	
	
	
	
	
	
	
}
