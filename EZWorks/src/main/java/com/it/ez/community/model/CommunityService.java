package com.it.ez.community.model;

import java.util.List;

import com.it.ez.communityBoard.model.C_boardClassicVO;
import com.it.ez.communityBoard.model.C_boardVO;

public interface CommunityService {
	int insertCommunity(CommunityVO vo);
	List<CommunityMemberVO> selectCommunity();
	CommunityVO selectCommunityByNo(int communityNo);
	List<CommunityMemberVO>selectCommunityByMember(int memberNo);
	List<CommunityMemberVO>selectMember(int commnityNo);
	int insertCommunityMember(CommunityMemberVO memVo);
	String selectCommunityMaster(int communityNo);
}
