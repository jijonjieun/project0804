package com.poseidon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poseidon.service.BoardService;
import com.poseidon.service.LoginService;
import com.poseidon.util.Util;

@RestController
public class ResttController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private BoardService boardService;
	
	@Autowired	
	private Util util;

	// 아이디 중복검사 2023-08-02
	// 결과값을 바디에 찍겠습니다.리스폰스바디
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		int result = loginService.checkID(id);
		// json
		JSONObject json = new JSONObject();
		json.put("result", result);

		System.out.println(json.toString());
		return json.toString();
		// return "{ result : " + result + "}";

	}

	// boardList2
	@GetMapping(value = "/boardList2", produces = "application/json; charset=UTF-8")
	public String boardList2(@RequestParam("pageNo") int pageNo) {
		// System.out.println("jq가 보내주는 : " + pageNo);

		List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);
		// System.out.println(list);
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(list);
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr);
		// System.out.println(json.toString());

		return json.toString();

	}

	@PostMapping("/cdelR")
	   public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {

		
			//if문 추가하기
		JSONObject json = new JSONObject();
		
		int result = 0;
		   if(session.getAttribute("mid") != null){
		         //값 들어왔는지 여부 검사
		         if(map.get("bno") !=null && map.get("cno") !=null &&
		               !(map.get("bno").equals("")) && !(map.get("cno").equals("")) && 
			               util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {
		            
		            //System.out.println("여기로 들어왔습니다.");
		            map.put("mid" , session.getAttribute("mid"));
		            result = boardService.cdel(map);
		            
		            
		          //  System.out.println("삭제결과 : " + result);
		            	
		         }
		         json.put("result", result);
		   }
		   
		   return json.toString();
	   }
	
	
	
	
	
	

}
