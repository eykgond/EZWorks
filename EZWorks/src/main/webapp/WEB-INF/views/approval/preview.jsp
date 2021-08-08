<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 미리보기</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/iconly/bold.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/app.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/tree.css'/>">
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/apexcharts/apexcharts.js'/>"></script>
<script src="<c:url value='/resources/js/pages/dashboard.js'/>"></script>
<script src="<c:url value='/resources/js/main.js'/>"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/summernote/summernote-lite.min.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

<style>
	/* sign_type1 */
div.sign_type1 {display: inline-block; margin-right: -1px; font-size: 12px}
div.sign_type1.last table.tb_sign_type1 {border-left: 0}
div.sign_type1 table.tb_sign_type1, table.sign_member {border-spacing: 0; border-collapse: collapse;width:60px}
div.sign_type1 table.tb_sign_type1 {border: 1px solid #666}
div.sign_type1 table.tb_sign_type1 tbody tr th {width: 20px; background: #eee; padding: 4px; text-align: center; word-break: break-word; white-space: normal}
div.sign_type1 table.tb_sign_type1 tbody tr td {border-left: 1px solid #666; padding: 0!important}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td {height: 26px; border-left: 0; border-bottom: 1px solid #666; min-height:26px; vertical-align: middle}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.last {border-bottom: 0}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span {display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 70px; padding: 4px; font-size:12px }
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_name {height: 36px}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.arbitrary {background: url(../images/arbitrary.gif) no-repeat}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span img {width: auto; height: 100%}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.doc_return {padding:0;}

/* sign_type_new */
div.sign_type_new {display: inline-block; margin-right: -1px; font-size: 12px}
div.sign_type_new.last table.tb_sign_type1 {border-left: 0}
div.sign_type_new table.tb_sign_type1 {border: 1px solid #666}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_name {height: auto}
div.sign_type_new table.tb_sign_type1 tbody tr th {width: 15px; background: #eee; padding: 6px; text-align: center; word-break: break-word; white-space: normal}
div.sign_type_new table.tb_sign_type1 tbody tr td {border-left: 1px solid #666; padding:0 !important}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td {height: 26px; border-left: 0; border-bottom: 1px solid #666; min-height:26px}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.last {border-bottom: 0}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span {display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 70px; font-size:12px; padding: 2px 4px}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_name,
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_position,
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_rank,
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_type {height: 48px; text-align: center}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_sign {height: 74px;text-align: center;}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_stamp {height: 40px; padding-bottom: 0}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_stamp img {width: auto; height: 100%}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.arbitrary {background: url(../images/arbitrary.gif) no-repeat; height: 36px; padding:0}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_arbitrary {padding:0}

span.sign_type2 span.sign_member {border: 1px solid #000; padding: 4px; display:block; margin: 0 0 -1px}
span.sign_type2 span.sign_member span.name {color: #333}
span.sign_type2 span.sign_member span.date {margin: 0!important}
span.sign_type2 span.sign_member span.rank {margin: 0 0 0 4px}

/* sign_type1_iline */
.sign_type1_inline {position: relative; display: inline-table!important; border-collapse: separate; border-spacing: 0; white-space: normal; font-size: 12px; margin: 1px -1px 0 0; padding-left: 26px;}
.sign_type1_inline:after {display: block; clear: left; overflow: hidden; height: 0; content: ''}
.sign_type1_inline:empty {padding-left: 0;}
.sign_type1_inline .sign_tit_wrap {position: absolute; top: -1px; left: 0; bottom: 0; vertical-align: middle; border: 1px solid #000; width: 24px; background: #eee; display: table-cell}
.sign_type1_inline .sign_tit_wrap .sign_tit {display: table; padding: 0 2px; text-align: center; word-break: break-all; white-space: normal; height: 100%}
.sign_type1_inline .sign_tit_wrap .sign_tit strong {display: table-cell; vertical-align: middle}
.sign_type1_inline .sign_member_wrap {vertical-align: top; background: #fff; display: table-cell; float: left; border: 1px solid #000; border-left: 0; margin: -1px 0 0 0}
.sign_type1_inline .sign_member_wrap .sign_member {width: 79px; vertical-align: top; display: table; table-layout: fixed}
.sign_type1_inline .sign_member_wrap .sign_member .sign_rank_wrap, .sign_type1_inline .sign_member_wrap .sign_member .sign_date_wrap {display: table-row}
.sign_type1_inline .sign_member_wrap .sign_member .sign_rank, .sign_type1_inline .sign_member_wrap .sign_member .sign_wrap, .sign_type1_inline .sign_member_wrap .sign_member .sign_date {display: table-cell; vertical-align: middle; text-align: center; width: 79px}
.sign_type1_inline .sign_member_wrap .sign_member .sign_rank {height: 26px}
.sign_type1_inline .sign_member_wrap .sign_member .sign_wrap {height: 75px; border-top: 1px solid #000}
.sign_type1_inline strong {font-weight:bold;}
.sign_type1_inline .sign_member_wrap .sign_member .sign_wrap .arbitrary { background: url(../images/arbitrary.gif) no-repeat; height: 40px; width: 79px; padding: 0;}
.sign_type1_inline .sign_member_wrap .sign_member .sign_date {height: 26px; border-top: 1px solid #000}
.sign_type1_inline .sign_member_wrap .sign_member .sign_stamp {width: 79px; height: 40px}
.sign_type1_inline .sign_member_wrap .sign_member .sign_stamp img {width: auto;  height: 100%;}
.sign_type1_inline .sign_member_wrap .sign_member .sign_wrap > span {padding: 2px 0; display: block}
.sign_type1_inline .sign_rank, .sign_type1_inline .sign_name, .sign_type1_inline .sign_position, .sign_type1_inline .sign_type, .sign_type1_inline .sign_date {overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 79px; }
.sign_arbitrary {background: url(../images/arbitrary.gif) no-repeat; height: 40px; width: 79px; padding: 0;}
	
</style>
</head>
<body>
	${preview}
</body>
</html>