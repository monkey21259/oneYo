function drawChart1() {
	var a = $.ajax({
			url: "googlePieChartData.ict",
			dataType: "json",
			async: !1
		}).responseText,
		t = new google.visualization.DataTable(a);
	new google.visualization.PieChart(document.getElementById("chart_div")).draw(t, {
		width: 800,
		height: 480,
		is3D: !0,
		title: "oneYo(오내요) 게시판별 글 등록 현황",
		titlePosition: "out"
	})
}

function drawChart2() {
	var a = $.ajax({
			url: "googleBarChartData.ict",
			dataType: "json",
			async: !1
		}).responseText,
		t = new google.visualization.DataTable(a);
	new google.visualization.ColumnChart(document.getElementById("chart_div")).draw(t, {
		width: 800,
		height: 480,
		title: "oneYo(오내요) 게시판별 총 조회수 현황",
		titlePosition: "out"
	})
}

function drawChart3() {
	var a = $.ajax({
			url: "chartjsPieChartData.ict",
			dataType: "json",
			async: !1,
			success: function (data) {
				$("#chart_div").empty();
				$("#chart_div").append($("<canvas id='mychart' style='width:800px; height:480px; display: inline-block;'>"));
				
				let valueSum = 0;

				for(let i=0; i<data[0].total.length; i++) {
					valueSum += data[0].total[i];
				}
				
			    chart = new Chart(document.getElementById("mychart"), {
			    plugins: [ChartDataLabels],
                type: 'pie',
                data: {
                    labels: data[0].label,
                    datasets: [
                        {
                        	label: '게시판별 글 작성 개수',
                            data: data[0].total,
                            borderColor: 'rgb(230, 230, 230)',
                            backgroundColor: [
                            	  'rgb(255, 77, 77)',
                                  'rgb(255, 179, 102)',
                                  'rgb(255, 255, 102)',
                                  'rgb(102, 255, 102)',
                                  'rgb(77, 195, 255)',
                                  'rgb(102, 179, 255)',
                                  'rgb(204, 51, 255)'
                            ]
                        }
                    ],
                    borderWidth: 1,
                    hoverOffset: '10px',
                },
                options: {
                	responsive: false,
                	plugins: {
                		legend: {
                			display: true,
                			position: 'bottom'
                		},
                		tooltip: {
                			enabled: false
                		},
                		datalabels: {
                			color: '#404040',
	                    	formatter: function(value, context) {
	                    		let idx = context.dataIndex;
	                    		let percentage = Math.round(((value / valueSum) * 100), 0) + '%';
	                    		return context.chart.data.labels[idx] + " " + percentage;
                    		}
                    	},
                    	title: {
                    		display: true,
                    		text: 'oneYo(오내요) 분야별 레시피 비율'
                    	}
                	}
                }
            });
			}
		});
}

function drawChart4() {
	var a = $.ajax({
			url: "chartjsPieChartData.ict",
			dataType: "json",
			async: !1,
			success: function (data) {
				$("#chart_div").empty();
				$("#chart_div").append($("<canvas id='mychart' style='width:800px; height:480px; display: inline-block;'>"));
			    chart = new Chart(document.getElementById("mychart"), {
			    plugins: [ChartDataLabels],
                type: 'bar',
                data: {
                    labels: data[0].label,
                    datasets: [
                        {
                        	label: '게시판별 글 작성 개수',
                            data: data[0].total,
                            borderColor: 'rgb(230, 230, 230)',
                            backgroundColor: [
                            	  'rgb(255, 77, 77)',
                                  'rgb(255, 179, 102)',
                                  'rgb(255, 255, 102)',
                                  'rgb(102, 255, 102)',
                                  'rgb(77, 195, 255)',
                                  'rgb(102, 179, 255)',
                                  'rgb(204, 51, 255)'
                            ]
                        }
                    ],
                    borderWidth: 1,
                },
                options: {
                	responsive: false,
                	title: 'oneYo(오내요) 게시판별 글 등록 현황',
                	plugins: {
                		legend: {
                			display: false
                		},
                		datalabels: {
                		    color: '#404040',
	                    	formatter: function(value, context) {
	                    		var idx = context.dataIndex;
	                    		return context.chart.data.labels[idx] + ' : ' + value + '개';
                    		}
                    	},
                    	title: {
                    		display: true,
                    		text: 'oneYo(오내요) 레시피게시판 분야별 글 개수'
                    	}
                	}
                }
            });
			}
		});
}

$(document).ready((function() {
	google.charts.load("current", {
		packages: ["bar"]
	}), google.load("visualization", "1", {
		packages: ["corechart"]
	}), google.setOnLoadCallback(drawChart1), 
	$(document).on("click", "#googlePieBtn", drawChart1), 
	$(document).on("click", "#googleBarBtn", drawChart2),
	$(document).on("click", "#chartjsPieBtn", drawChart3),
	$(document).on("click", "#chartjsBarBtn", drawChart4)
}));