package com.it.ez.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.it.ez.approval.model.ApprovalFileVO;
import com.it.ez.approval.model.ApprovalLineVO;
import com.it.ez.approval.model.ApprovalService;
import com.it.ez.approval.model.ApprovalVO;
import com.it.ez.approval.model.BrowseVO;
import com.it.ez.approval.model.ReceptionVO;
import com.it.ez.approval.model.ReferenceVO;
import com.it.ez.archive.common.ConstUtil;
import com.it.ez.archive.common.FileUploadUtil;
import com.it.ez.archive.model.ArchiveVO;
import com.it.ez.emp.model.EmpService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/approval")
@RequiredArgsConstructor
public class ApprovalController {
	
	private final ApprovalService approvalService;
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/main")
	public void main(Model model,HttpServletRequest request,HttpSession session){
		
		HttpSession session2 =  request.getSession();
		session2.setAttribute("empNo", 1);
		session2.setAttribute("deptNo", 101);
		session2.setAttribute("deptName", "EZ그룹");
		session2.setAttribute("empName", "김상후");
		session2.setAttribute("posName", "대표이사");
		
		int empNo=(int)session.getAttribute("empNo");
		List<Map<String,Object>> list1 = approvalService.selectWaitApproval(empNo);
		List<Map<String,Object>> list2 = approvalService.selectDraftContinue(empNo);
		List<Map<String,Object>> list3 = approvalService.selectDraftAgree(empNo);
		
		model.addAttribute("list1",list1); //결재 대기 리스트 추출
		model.addAttribute("list2",list2); //기안 진행 리스트 추출
		model.addAttribute("list3",list3); //기안 완료 리스트 추출
	}
	
	@GetMapping("/wait")
	public void waitApproval(Model model,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		List<Map<String,Object>> list = approvalService.selectWaitApproval(empNo);
		
		model.addAttribute("list",list);
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int approvalNo,@RequestParam int formNo,Model model,HttpSession session) {
		
		int empNo=(int)session.getAttribute("empNo");
		
		List<Map<String,Object>> stampList= approvalService.selectStamp(approvalNo);
		Map<String,Object> map=approvalService.selectWaitApprovalVO(approvalNo);
		
		model.addAttribute("stampList",stampList);
		model.addAttribute("vo",map);
		model.addAttribute("approval",approvalService.selectApprovalByNo(approvalNo));
		model.addAttribute("reference",approvalService.selectReference(approvalNo));
		model.addAttribute("browse",approvalService.selectBrowse(approvalNo));
		model.addAttribute("reception",approvalService.selectReception(approvalNo));
		model.addAttribute("myEmpNo",empNo);
		
		long totalFileSize=0;
		for(ApprovalFileVO vo:approvalService.selectApprovalFile(approvalNo)) {
			totalFileSize+=vo.getAfFilesize();
		}
		
		model.addAttribute("totalFileSize",totalFileSize);
		
		model.addAttribute("fileList",approvalService.selectApprovalFile(approvalNo));
		
		ApprovalLineVO alvo= new ApprovalLineVO();
		alvo.setEmpNo(empNo);
		alvo.setApprovalNo(approvalNo);
		model.addAttribute("approvalLineOrder",approvalService.selectApprovalLineOrder(alvo));
		if(formNo==3) {
			return "approval/form3Detail";
		}
		return "";
	}
	
	@Transactional
	@PostMapping("/cancel")
	public String cancel(@RequestParam int approvalNo,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		int cnt=approvalService.updateApprovalCancel(approvalNo);
		ApprovalLineVO alvo = new ApprovalLineVO();
		alvo.setEmpNo(empNo);
		alvo.setApprovalNo(approvalNo);
		cnt=approvalService.updateApprovalLineCancel(alvo);
		return "redirect:/approval/wait";
	}
	
	@Transactional
	@PostMapping("/agree")
	public String agree(@ModelAttribute ApprovalLineVO vo,@RequestParam String nextApproval,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		int cnt=0;
		if(approvalService.isCompleteApproval(vo.getApprovalNo())>0) {
			cnt=approvalService.updateCurrentStateComplete(vo.getApprovalNo());
		}
		cnt = approvalService.updateApproval(vo.getApprovalNo());
		cnt = approvalService.updateApprovalLine(vo);
		if(nextApproval.equals("N")) {
			return "redirect:/approval/wait";
		}else {
			return "";
		}
		
	}
	
	@Transactional
	@PostMapping("/disagree")
	public String disagree(@ModelAttribute ApprovalLineVO vo,@RequestParam String nextApproval,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		vo.setEmpNo(empNo);
		
		int cnt=approvalService.updateCurrentStateDisagree(vo.getApprovalNo());
		cnt = approvalService.updateApproval(vo.getApprovalNo());
		cnt = approvalService.updateApprovalLine(vo);
		cnt=approvalService.updateApprovalLineDisagree(vo);
		
		if(nextApproval.equals("N")) {
			return "redirect:/approval/wait";
		}else {
			return "";
		}
		
	}
	
	@GetMapping("/complete")
	public void complete(Model model,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		List<Map<String,Object>> list = null;
		list = approvalService.selectCompleteApproval(empNo);
		model.addAttribute("list",list);
		
	}
	
	@PostMapping("/insert")
	@Transactional
	public String insert(@ModelAttribute ApprovalVO approvalVo,@RequestParam String alEmpNo,
			@RequestParam String alDeptNo,@RequestParam String alOrderNo,@RequestParam String referenceEmpNo,HttpSession session,
			@RequestParam String referenceDeptNo,@RequestParam String browseEmpNo,@RequestParam String receptionEmpNo,@RequestParam(defaultValue="0") int tempApprovalNo,HttpServletRequest request) {
		int empNo=(int)session.getAttribute("empNo");
		int deptNo=(int)session.getAttribute("deptNo");
		if(tempApprovalNo!=0) {
			
			int cnt = approvalService.deleteApproval(tempApprovalNo);
			//임시저장된 문서일 경우 기존 임시저장문서를 지움
		}
		
		
		approvalVo.setEmpNo(empNo);
		approvalVo.setDeptNo(deptNo);
		
		approvalService.insertApproval(approvalVo);
		
		int approvalNo=approvalVo.getApprovalNo();
		
		String fileName="";
		long fileSize=0;
		String originalFileName="";
		String ext="";
		List<ApprovalFileVO> afList = new ArrayList<ApprovalFileVO>();
		try {
			List<Map<String,Object>> list = fileUploadUtil.fileUpload(request,"approvalFile");
			
			for(Map<String,Object>map:list) {
				
				fileName=(String)map.get("fileName");
				fileSize=(long)map.get("fileSize");
				originalFileName=(String)map.get("originalFileName");
				ext=(String)map.get("ext");
				
				ApprovalFileVO vo =new ApprovalFileVO();
				vo.setAfFilename(fileName);
				vo.setAfOriginalfilename(originalFileName);
				vo.setAfFilesize(fileSize);
				vo.setApprovalNo(approvalNo);
				vo.setExt(ext);			
				afList.add(vo);
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int cnt=0;
		if(afList.size()>0) {
			cnt=approvalService.insertApprovalFile(afList);
		}
		
		if(alEmpNo!=null && !alEmpNo.isEmpty()) {
			List<ApprovalLineVO> list = new ArrayList<ApprovalLineVO>();
			
			String[] alEmpNoArr =alEmpNo.split(",");
			String[] alDeptNoArr = alDeptNo.split(",");
			String[] alOrderNoArr = alOrderNo.split(",");
			
			int size = alEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				ApprovalLineVO vo = new ApprovalLineVO();
				vo.setApprovalNo(approvalNo);
				vo.setAlOrder(Integer.parseInt(alOrderNoArr[i]));
				vo.setEmpNo(Integer.parseInt(alEmpNoArr[i]));
				vo.setDeptNo(Integer.parseInt(alDeptNoArr[i]));
				vo.setIsReceptedApproval("N");
				list.add(vo);
			}
			
			approvalService.insertApprovalLine(list);
		}
		
		if(referenceEmpNo!=null && !referenceEmpNo.isEmpty()) {
			List<ReferenceVO> list2= new ArrayList<ReferenceVO>();
			String[] refEmpNoArr = referenceEmpNo.split(",");
			String[] refDeptNoArr = referenceDeptNo.split(",");
			
			int size=refEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				ReferenceVO vo = new ReferenceVO();
				vo.setApprovalNo(approvalNo);
				vo.setDeptNo(Integer.parseInt(refDeptNoArr[i]));

				vo.setEmpNo(Integer.parseInt(refEmpNoArr[i]));
				list2.add(vo);
			}
			
			approvalService.insertReference(list2);
		}
		
		if(browseEmpNo!=null && !browseEmpNo.isEmpty()) {
			List<BrowseVO> list3= new ArrayList<BrowseVO>();
			String[] browEmpNoArr = browseEmpNo.split(",");
			
			int size=browEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				BrowseVO vo = new BrowseVO();
				vo.setApprovalNo(approvalNo);
				vo.setEmpNo(Integer.parseInt(browEmpNoArr[i]));
				list3.add(vo);
			}
			
			approvalService.insertBrowse(list3);
		}
		
		if(receptionEmpNo!=null && !receptionEmpNo.isEmpty()) {
			List<ReceptionVO> list4= new ArrayList<ReceptionVO>();
			String[] receptEmpNoArr = receptionEmpNo.split(",");
			
			int size=receptEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				ReceptionVO vo = new ReceptionVO();
				vo.setApprovalNo(approvalNo);
				vo.setEmpNo(Integer.parseInt(receptEmpNoArr[i]));
				vo.setIsRecepted("N");
				list4.add(vo);
			}
			
			approvalService.insertReception(list4);
		}
		
		
		return "redirect:/approval/main";
	}
	
	@GetMapping("/reference")	
	@Transactional
	public String reference(Model model,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		model.addAttribute("reference",approvalService.selectReferenceByEmpNo(empNo));
		model.addAttribute("browse",approvalService.selectBrowseByEmpNo(empNo));
		model.addAttribute("union",approvalService.selectUnionRef(empNo));
		return "approval/reference";
	}
	
	@GetMapping("/draft")
	public String draft(Model model,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		model.addAttribute("all",approvalService.selectDraftAll(empNo));
		model.addAttribute("continues",approvalService.selectDraftContinue(empNo));
		model.addAttribute("agree",approvalService.selectDraftAgree(empNo));
		model.addAttribute("disagree",approvalService.selectDraftDisagree(empNo));
		return "approval/draft";
	}
	
	@GetMapping("/temp")
	public String temp(Model model,HttpSession session) {
		int empNo=(int)session.getAttribute("empNo");
		model.addAttribute("tempList",approvalService.selectTempList(empNo));
		return "approval/temp";
	}
	
	@GetMapping("/cancelDraft")
	public String cancelDraft(@RequestParam int approvalNo,HttpServletRequest request) {
		int cnt=approvalService.deleteApprovalFile(approvalNo, request);
		cnt=approvalService.deleteApproval(approvalNo);
		return "redirect:/approval/draft";
	}
	
	
	@PostMapping("/download")
	public ModelAndView download(@ModelAttribute ApprovalFileVO vo,HttpServletRequest request) {
		String uploadPath = request.getSession().getServletContext().getRealPath(ConstUtil.FILE_UPLOAD_PATH_APPROVALFILE);
		System.out.println(vo);
		File file= new File(uploadPath,vo.getAfFilename());
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("file", file);
		map.put("originalFileName", vo.getAfOriginalfilename());
		
		ModelAndView mav = new ModelAndView("ApprovalDownloadView",map);
		return mav;
	}
	
	@GetMapping("/draftByDept")
	public String draftAgreeByDept(HttpSession session,Model model) {
		int deptNo=(int)session.getAttribute("deptNo");
		model.addAttribute("list",approvalService.selectDraftAgreeByDept(deptNo));
		model.addAttribute((String)session.getAttribute("deptName"));
		return "approval/draftByDept";
	}

	@GetMapping("/referenceByDept")
	public String referenceByDept(HttpSession session,Model model) {
		int deptNo=(int)session.getAttribute("deptNo");
		model.addAttribute("list",approvalService.selectReferenceByDeptNo(deptNo));
		model.addAttribute((String)session.getAttribute("deptName"));
		return "approval/referenceByDept";
	}
}
