/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	console.log("editEvent >>> : ");
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');
    
    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);
        var eventData = {
                cal_no: event._id,
                cal_title: editTitle.val(),
                cal_startdate: editStart.val(),
                cal_enddate: editEnd.val(),
                cal_description: editDesc.val(),
                cal_type: editType.val(),
                cal_backgroundColor: editColor.val(),
                cal_textColor: '#ffffff',
                cal_allDay: false,
                m_id: event.username
            };
        
        //일정 업데이트
        $.ajax({
            type: "get",
            url: "/oneYo/calendarUpdate.ict",
            data: eventData/*{
                
            }*/,
            success: function (response) {
                alert('수정되었습니다.')
                window.location.reload();
            }
        }); // ajax end 

    });
    
    
    // 삭제버튼
    $('#deleteEvent').unbind();
    $('#deleteEvent').on('click', function () {
    	console.log("삭제 버튼 클릭 >>> : " + event);
    	
        $('#deleteEvent').unbind();
        $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
        eventModal.modal('hide');
        var eventData = {
                'cal_no': event._id,
                'm_id' : event.username
            };
        console.log("eventData >>> : " + eventData);
        //삭제시
        $.ajax({
            type: "get",
            url: "/oneYo/calendarDelete.ict",
            data: eventData,
            
            success: function (response) {
                alert('삭제되었습니다.');
                window.location.reload();
            }
        });

    });
};

