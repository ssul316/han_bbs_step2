package org.han.web;

import java.util.List;

import javax.inject.Inject;

import org.han.service.ReplyService;
import org.han.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bbs/reply/*")
public class ReplyController {
	
	@Inject
	ReplyVO vo;
	
	@Inject
	ReplyService service;
	
	@RequestMapping("/list")
	public @ResponseBody List<ReplyVO> list(@RequestParam(value="bno", defaultValue="0") int bno){
		return service.list(bno);
	}
}
