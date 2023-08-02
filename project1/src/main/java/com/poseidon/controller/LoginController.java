package com.poseidon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poseidon.dto.JoinDTO;
import com.poseidon.dto.LoginDTO;
import com.poseidon.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request) {

		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		// 생각해보기 id/pw을 보냈을 때 무엇이 왔으면 좋을까요?
		// 이름 + count(*)
		LoginDTO result = loginService.login(dto);

		// System.out.println(result.getM_name());
		// System.out.println(result.getCount());

		if (result.getCount() == 1) {
			// 세션을 만들어서 로그인 지정시간동안 유지시킵니다.
			HttpSession session = request.getSession(); // 이렇게 객체생성하니까 그냥외워
			session.setAttribute("mname", result.getM_name());
			session.setAttribute("mid", dto.getM_id());
			// 엠네임이란 이름으로 지금 로그인한 사람을 저장시켜.
			// 세션: 서버, 쿠키: 클라이언트=브라우저에 저장됨.
			return "redirect:index"; // 정상적로그인

		} else {
			return "login"; // 아니면 그냥 로그인다시해잇 ㅋ
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("mname") != null) {// 세션이 있다면
			// session.invalidate();//세션 삭제하기
			session.removeAttribute("mname");
		}
		if (session.getAttribute("mid") != null) {// 세션이 있다면
			// session.invalidate();//세션 삭제하기
			session.removeAttribute("mid");
		}

		session.setMaxInactiveInterval(0); // 세션 유지시간을 0으로 = 종료시키기

		session.invalidate();// 세션 초기화 = 종료 = 세션의 모든 속성 값을 제거

		return "redirect:index";

	}

	@GetMapping("/join")
	public String join() {
		return "join";
	}

	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
		int result = loginService.join(joinDTO);

		if (result == 1) {
			return "redirect:/login";
		} else {
			return "redirect:/join";

		}

	}

	@GetMapping("/members")
	public ModelAndView members() {
		ModelAndView mv = new ModelAndView("members");
		List<JoinDTO> list = loginService.members();
		mv.addObject("list", list);
		return mv;

	}


}
