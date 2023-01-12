var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
// INSERT UPDATE 여부 TYPE 명
var eventType = "insert";

/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새 일정 등록');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {
		//alert("save-event >>> : ");
        var eventData = {
            cal_no: eventId,
            cal_title: editTitle.val(),
            cal_startdate: editStart.val(),
            cal_enddate: editEnd.val(),
            cal_description: editDesc.val(),
            cal_type: editType.val(),
            cal_backgroundColor: editColor.val(),
            cal_textColor: '#ffffff',
            cal_allDay: editAllDay.is(':checked'),
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');
            
            var d = new Date($("#edit-start").val()), 
								month = '' + (d.getMonth() + 1),
								day = '' + d.getDate(),
								year = d.getFullYear();
			if (month.length < 2) month = '0' + month; 
			if (day.length < 2) day = '0' + day;
			
			var realDate = [year, month, day].join('-');
            eventData.allDay = true;
            eventData = {
                    cal_no: eventId,
                    cal_title: editTitle.val(),
                    cal_startdate: realDate,
                    cal_enddate: realDate,
                    cal_description: editDesc.val(),
                    cal_type: editType.val(),
                    cal_backgroundColor: editColor.val(),
                    cal_textColor: '#ffffff',
                    cal_allDay: editAllDay.is(':checked')
                };
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "/oneYo/calendarInsert.ict",
            data: eventData/*{
                //.....
            }*/,
            success: function (response) {
            	
            	console.log(response);
            	var data = $(response).find("result").text();
            	console.log("data >>> : " + data);
            	alert('일정이 저장되었습니다.');
            	window.location.reload();
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};