package com.it.ez.community.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.community.model.CommunityService;
import com.it.ez.community.model.CommunityVO;
import com.it.ez.communityBoard.model.C_boardContentVO;
import com.it.ez.communityBoard.model.C_boardService;
import com.it.ez.communityBoard.model.C_boardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
	private static final Logger logger 
		= LoggerFactory.getLogger(CommunityController.class);
	
	private final CommunityService communityService;
	private final C_boardService c_boardSerivce;
	
	@GetMapping("/communityMain")
	public String community(Model model) {
		logger.info("커뮤니티 메인 페이지");
		
		List<CommunityVO> list=communityService.selectCommunity();
		List<C_boardContentVO> contentList= c_boardSerivce.selectC_boardContent();
		logger.info("커뮤니티 개설 처리결과, list.size={}, contentList.size={}", 
				list.size(), contentList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("contentList", contentList);
		
		return "community/communityMain";
	}
	
	@GetMapping("/communityNew")
	public String newCommunity(Model model) {
		logger.info("커뮤니티 개설 페이지");
		
		List<CommunityVO> list=communityService.selectCommunity();
		logger.info("커뮤니티 개설 처리결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "community/communityNew";
		
	}
	
	@PostMapping("/communityNew")
	public String newCommunity_post(@ModelAttribute CommunityVO vo, Model model) {
		logger.info("커뮤니티 개설 처리, 파라미터 communityVo={}", vo);
		
		int cnt = communityService.insertCommunity(vo);
		logger.info("커뮤니티 개설 처리결과, cnt={}", cnt);
		
		String msg="커뮤니티 개설 실패!", url="/community/communityNew";
		if(cnt>0) {
			msg="커뮤니티가 개설되었습니다.";
			url="/community/communityMain";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}

	@GetMapping("/communityDetail")
	public String detailCommunity(@RequestParam(defaultValue = "0") int communityNo, 
			Model model) {
		logger.info("커뮤니티 정보 보기, 파라미터 communityNo={}", communityNo);
		
		List<CommunityVO> list = communityService.selectCommunity();
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<C_boardVO> boardList= c_boardSerivce.selectC_board(communityNo);
		logger.info("커뮤니티 게시판 목록 결과, list.size={}, Boardlist.size={}", 
				list.size(), boardList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);

		return "community/communityDetail";
	}
	
	
	@GetMapping("/communityOne")
	public String oneCommunity(@RequestParam(defaultValue = "0")int communityNo, Model model) {
		logger.info("개별 커뮤니티 페이지, 파라미터 communityNo={}", communityNo);
		
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardSerivce.selectC_board(communityNo);
		List<C_boardContentVO> contentList= c_boardSerivce.selectC_boardContent();
		logger.info("개별 커뮤니티 처리결과, vo={}, list.size={}, boardList.size={}, contentList.size={}", 
				vo, list.size(), boardList.size(), contentList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);
		model.addAttribute("contentList", contentList);
		
		return "community/communityOne";
		
	}
	
	@GetMapping("/communityWrite")
	public String writeCommunity(@RequestParam(defaultValue = "0") int communityNo, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 페이지, 파라미터 communityNo={}", communityNo);
		
		CommunityVO vo= communityService.selectCommunityByNo(communityNo);
		List<CommunityVO> list = communityService.selectCommunity();
		List<C_boardVO> boardList= c_boardSerivce.selectC_board(communityNo);
		logger.info("커뮤니티 게시판 목록 결과, vo={}, list.size={}, boardList.size={}", 
				vo, list.size(), boardList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);
		
		return "community/board/communityWrite";
	}
	
	@PostMapping("/communityWrite")
	public String writeCommunity_post(@ModelAttribute C_boardContentVO contentVo,
			@RequestParam int boardNo, Model model) {
		logger.info("커뮤니티 게시판 글쓰기 처리, 파라미터 contentVo={} boardNo={}", contentVo, boardNo);
		
		contentVo.setBoardNo(boardNo);
		int cnt = c_boardSerivce.insertBoardContent(contentVo);
		
		String msg="커뮤니티 게시판 글쓰기 실패!", url="/community/board/communityWrite";
		if(cnt>0) {
			msg="커뮤니티 게시판 글쓰기 성공";
			url="/community/communityOne";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
}
