<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	O_Session oSession = O_Session.getInstance();
	String mnum = oSession.getSession(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>오내요 캘린더</title>

<link rel="stylesheet" href="/oneYo/calendar/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="/oneYo/calendar/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href="/oneYo/calendar/vendor/css/select2.min.css" />
<link rel="stylesheet" href="/oneYo/calendar/vendor/css/bootstrap-datetimepicker.min.css" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="/oneYo/calendar/css/main.css">
	
</head>

<body>
	<input type="hidden" id="mnumVal" value="<%=mnum %>">
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">요리교실</a></li>
                <li><a tabindex="-1" href="#">장날</a></li>
                <li><a tabindex="-1" href="#">음식축제</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">새 일정 등록</h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <label><input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
						
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="요리교실">요리교실</option>
                                    <option value="장날">장날</option>
                                    <option value="음식축제">음식축제</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨강</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파랑</option>
                                    <option value="#f06595" style="color:#f06595;">핑크</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록</option>
                                    <option value="#03d7fc" style="color:#03d7fc;">하늘</option>
                                    <option value="#495057" style="color:#495057;">검정</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>
            

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="요리교실">요리교실</option>
                            <option value="장날">장날</option>
                            <option value="음식축제">음식축제</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
    <script src="/oneYo/calendar/vendor/js/jquery.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/bootstrap.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/moment.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/fullcalendar.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/ko.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/select2.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/vendor/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/main.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/addEvent.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/editEvent.js" charset="UTF-8"></script>
    <script src="/oneYo/calendar/js/etcSetting.js" charset="UTF-8"></script>
    
</body>

</html>