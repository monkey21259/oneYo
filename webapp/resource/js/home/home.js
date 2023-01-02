function Slider(target) {

	// status
	let index = 1;		// 배열 인덱스
	let isMoved = true;	// Flag
	const speed = 1000;	// 애니메이션 속도

	// direction
	const transform = "transform " + speed / 1000 + "s";	// 이동할 속도
	let translate = (i) => "translateX(-" + 100 * i + "%)";	// 이동할 애니메이션

	// Slider
	const slider = document.querySelector(target);	// 사용할 슬라이더 : banner
	const sliderRects = slider.getClientRects()[0];	// 슬라이더 내 하나의 원소(프로퍼티 get용)
	slider.style["overflow"] = "hidden";			// 슬라이더 overflow 처리
	
	// 슬라이더 화면 컨테이너
	const container = document.createElement("div");	// 추가할 div 태그 생성
	container.style["display"] = "flex";				// 박스를 감싸는 div 태그의 display를 flex로 설정
	container.style["flex-direction"] = "row";			// 가로 방향으로 flex 나열
	container.style["width"] = sliderRects.width + "px";
	container.style["height"] = sliderRects.height + "px";
	container.style["transform"] = translate(index); 	// 애니메이션 설정 시 바뀔 형태를 가진 화살표 함수 객체
	
	// 슬라이더 화면 목록
	let boxes = [].slice.call(slider.children);						// banner의 자식요소 div(box)
	boxes = [].concat(boxes[boxes.length - 1], boxes, boxes[0]);	// 끝 박스 + 원래 박스 + 첫 박스
	
	// 슬라이더 화면 스타일
	const size = boxes.length;		// 현재 존재하는 div("box) 객체를 담는 리스트의 사이즈
	for (let i=0; i<size; i++) {
		const box = boxes[i];
		box.style["flex"] = "none";
		box.style["flex-wrap"] = "wrap";
		box.style["height"] = "100%";
		box.style["width"] = "100%";
		container.appendChild(box.cloneNode(true));
	}
	
	// 처음/마지막 화면 눈속임 이벤트
	container.addEventListener("transitionstart", function() {	// 애니메이션 시작 시
		isMoved = false;	// 동작하는 동안 움직임 폐쇄
		setTimeout(() => {	// 타임아웃 설정하기 : 일정시간 이후 움직임 개방
			isMoved = true;
		}, speed);
	});
	
	container.addEventListener("transitionend", function() {	// 애니메이션 종료 시
		// 처음으로 순간이동
		if (index === size - 1) {
			index = 1;
			container.style["transition"] = "none";				// 애니메이션 효과 주지 않기
			container.style["transform"] = translate(index);	// 위치 이동하기
		}
		
		// 끝으로 이동
		if (index === 0) {
			index = size - 2;
			container.style["transition"] = "none";
			container.style["transform"] = translate(index);
		}
	});

	// 슬라이더 붙이기
	slider.innerHTML = "";
	slider.appendChild(container);	// 완성된 원소 추가하기

	return {
		move: function(i) {
			if (isMoved === true) {	// Flag가 On일 경우 애니메이션 주기
				index = i;
				container.style["transition"] = transform;
				container.style["transform"] = translate(index);
			}
		},
		next: function() {
			if (isMoved === true) {
				index = (index + 1) % size;
				container.style["transition"] = transform;
				container.style["transform"] = translate(index);	// 다음 번 Object로 이동하는 애니메이션
			}
		}
	};
}