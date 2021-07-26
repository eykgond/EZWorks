package com.it.ez.emp.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

//com.it.ez.emp.model.EmpDAO
@Mapper
public interface EmpDAO {
	public EmpVO selectEmpByEname(String empEname);
	public EmpVO selectEmpByEmpNo(int empNo);
	List<Map<String,Object>> selectOrganization();
}
