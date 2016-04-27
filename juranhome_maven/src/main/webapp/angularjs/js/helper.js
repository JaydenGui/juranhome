'use strict';
var app = angular.module('helper', ['appService']);
app.factory('page', function () {
	var page = {};
	page.init = function (opt) {
		var opt = opt || {};
		return {
			loading: opt.loading === false ? false : true,
			empty: true,
			current: 1,
			limit: opt.limit || 10,
			total: 0,
			set_page: function (page) {
				this.currentPage = page;
			},
			set_total: function (num) {
				this.totalItems = num;
			},
			set_val: function (type, value) {
				this[type] = value;
			},
			set_empty: function (value) {
				var val = !!value;
				this.set_val('empty', val);
			},
			set_loading: function (value) {
				var val = !!value;
				this.set_val('loading', val);
			},
			set_groupLoading: function (value) {
				var val = !!value;
				this.set_val('groupLoading', val);
			},
			go_page: function (page) {}
		};
	};
	return page;
});
app.factory('importobj', function ($http) {
	var X = {};
	//根据上传文件的扩展名调用不同xls对象
	function setX(ext) {
		X = ext === 'xlsx' ? XLSX : XLS;
	}

	function get_file(data) {
		setX(data.ext);
		return $http({
			method: 'get',
			responseType: 'arraybuffer',
			url: data.url
		});
	}

	function deal_xls(r, opt) {
		// convert data to binary string
		var data, arr = [],
			i, len, bstr, workbook, json_data, json_data_arr = [],
			k;
		data = new Uint8Array(r);
		len = data.length;
		for (i = 0; i < len; ++i) {
			arr[i] = String.fromCharCode(data[i]);
		}
		bstr = arr.join("");
		// Call XLS or XLSX
		workbook = X.read(bstr, {
			type: "binary"
		});
		json_data = to_json(workbook, opt);
		for (k in json_data) {
			json_data_arr = json_data_arr.concat(json_data[k]);
		}
		return json_data_arr;
	}

	function to_json(workbook, opt) {
		var result = {};
		workbook.SheetNames.forEach(function (sheetName) {
			var roa = X.utils.sheet_to_row_object_array(workbook.Sheets[sheetName], opt);
			if (roa.length > 0) {
				result[sheetName] = roa;
			}
		});
		return result;
	}

	return {
		get_file: get_file,
		deal_xsl: deal_xls
	}
});
app.factory('Message', function ($timeout) {
	var Message = {};
	Message.init = function () {
		return {
			success: false,
			error: false,
			text: '',
			type: '',
			showSuccess: function (msg, time) {
				this.type = '';
				var m, t,
					that = this;
				$timeout(function () {

					m = msg || '操作成功!';
					t = time || 3000;

					that.text = m;
					that.type = 'success';

					$timeout(function () {
						that.type = '';
					}, t);
				}, 100);
			},
			showError: function (msg, time) {
				this.type = '';
				var m, t,
					that = this;
				$timeout(function () {

					m = msg || '操作失败!';
					t = time || 3000;

					that.text = m;
					that.type = 'error';
					$timeout(function () {
						that.type = '';
					}, t);
				}, 100)
			}
		};
	};
	return Message;
});
app.factory('Dialog', function () {
	var D = {};
	D.init = function () {
		return {
			is_show: false,
			closeDialog: function () {
				this.is_show = false;
			},
			showDialog: function () {
				this.is_show = true;
			}
		}
	};
	return D;
});
app.factory('Calendar', function () {
	function Calendar(opts) {
		this.default_opts = {};
		this.custom_opts = null;
		if (opts) {
			this.custom_opts = opts;
		}
		this.current_month = {};
		this.custom_data = [];
		this.init = function () {
			this.create_table(this.fill_content());
		};
		this.set_custom_data = function (data) {
			this.custom_data = data;
		};
		this.turn = function (type) {
			if (type === 'prev') {
				this.set_current_month(this.prev_month());
				this.create_table(this.fill_content());
			}
			if (type === 'next') {
				this.set_current_month(this.next_month())
				this.create_table(this.fill_content());
			}
		}
		this.set_date_obj = function (obj) {
			obj.days = this.get_days(obj.month, obj.year);
			obj.day = 1;
			obj.week = this.get_week(this.date_format(obj));
			return obj;
		};
		this.init_current_month = function (date) {
			var today, current_month;
			today = this.get_date(date);
			current_month = {
				year: today.year,
				month: today.month,
				today: today,
				day: 1,
			};
			this.set_date_obj(current_month);
			this.set_current_month(current_month);
			return current_month;
		};
		this.prev_month = function () {
			var prev = {},
				cm;
			cm = this.get_current_month();
			prev.month = cm.month - 1 > 0 ? cm.month - 1 : 12;
			prev.year = cm.month - 1 > 0 ? cm.year : cm.year - 1;
			prev = this.set_date_obj(prev);
			return prev;
		};
		this.next_month = function () {
			var next = {},
				cm;
			cm = this.get_current_month();
			next.month = cm.month + 1 <= 12 ? cm.month + 1 : 1;
			next.year = cm.month + 1 <= 12 ? cm.year : cm.year + 1;
			next = this.set_date_obj(next);
			return next;
		};
		this.get_week = function (str_date) {
			var d = new Date(str_date);
			return d.getDay();
		};
		this.set_current_month = function (current_month) {
			current_month.format = current_month.year + '年' + current_month.month + '月';
			this.current_month = current_month
		};
		this.get_current_month = function () {
			return this.current_month;
		};
		this.date_format = function (obj) {
			var m, day;
			m = obj.month < 10 ? '0' + obj.month : obj.month;
			day = obj.day < 10 ? '0' + obj.day : obj.day;
			return obj.year + '-' + m + '-' + day;
		};
		this.get_date = function (date) {
			var dateobj = {},
				d = !!date ? new Date(date) : new Date();

			dateobj.day = d.getDate();
			dateobj.month = 1 + d.getMonth();
			dateobj.year = d.getFullYear();
			dateobj.week = d.getDay();
			return dateobj;
		};
		this.get_days = function (month, year) {
			var i, months, feb;
			feb = this.is_leapyear(year) ? 29 : 28;
			months = [0, 31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			return months[month];
		};
		this.is_leapyear = function (year) {
			return (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
		};
		this.create_table = function (content) {
			var box = document.getElementById(this.custom_opts.box);
			var calendar_table = box.getElementsByClassName('calendar-table');

			if (calendar_table.length > 0) {
				box.removeChild(calendar_table[0]);
			}
			var table, tr, td;
			table = document.createElement('table');
			table.className += 'calendar-table';
			for (var i = 0; i < 42; i++) {
				if (i % 7 === 0) {
					tr = document.createElement('tr');
					table.appendChild(tr);
				}
				td = document.createElement('td');
				td.innerHTML = '<div class="dateText">' + content[i]['dateText'] + '</div>';
				if (content[i]['custom_action']) {
					td.innerHTML += '<div class="customContent">' + content[i]['custom_action']['html'] + '</div>';
					if (content[i]['custom_action']['evtObj']) {

						td['on' + content[i]['custom_action']['evtObj']['type']] = content[i]['custom_action']['evtObj']['callback'];

					}
				} else {
					td.innerHTML += '<div class="customContent"></div>';
				}
				if (content[i]['type'] === 'disable') {
					td.className += 'disable'
				} else {
					td.className += 'normal';
				}
				tr.appendChild(td);

			}

			if (this.custom_opts && this.custom_opts.box) {
				document.getElementById(this.custom_opts.box).appendChild(table);
			}
		};
		this.create_infowin = function (opt) {
			var infowin, infowin_close, infowin_content, infowin_foot;
			if (opt.obj.getElementsByClassName('calendar-infowin').length > 0) {
				return;
			}
			infowin = document.createElement('div');
			infowin.className += 'calendar-infowin';
			infowin_content = document.createElement('div');
			infowin_content.className += 'calendar-infowin-content';
			if (content) {
				infowin_content.innerHTML = opt.content;
			}

			infowin_close = document.createElement('div');
			var span = document.createElement('span');
			infowin_close.appendChild(span);
			span.onclick = function (evt) {
				evt.stopPropagation();
				var r = opt.obj.removeChild(infowin);
				opt.obj.className = opt.obj.className.replace('focus', '');
			}
			infowin_close.className += 'calendar-infowin-close';



			infowin_foot = document.createElement('div');
			infowin_foot.className += 'calendar-infowin-foot';

			infowin.appendChild(infowin_close);
			infowin.appendChild(infowin_content);
			infowin.appendChild(infowin_foot);

			opt.obj.style.position = 'relative';
			opt.obj.className += ' focus';

			opt.obj.appendChild(infowin);


		};
		this.fill_content = function () {
			var i, dateobj, td_content = {},
				prev_month, next_month, len,
				content_arr = [],
				prev_flag;
			current_month = this.get_current_month();
			prev_month = this.prev_month();
			next_month = this.next_month();
			prev_flag = current_month.week === 0 ? 7 : current_month.week
			for (i = prev_flag - 1; i >= 0; i--) {
				content_arr.push({
					dateText: prev_month.days - i,
					type: 'disable'
				});
			}
			for (i = 1; i <= current_month.days; i++) {
				//此處需注意custom_data的長度
				var obj = {
					dateText: i,
					type: 'normal',
				};
				if (this.custom_data.length > 0) {
					obj.custom_action = this.custom_data[i - 1]
				}
				content_arr.push(obj);
			}
			len = content_arr.length;
			for (i = 1; i <= 42 - len; i++) {
				content_arr.push({
					dateText: i,
					type: 'disable'
				});
			}
			return content_arr;
		};
	}
	return Calendar;
});
//上传文件
app.factory('uploadFile', function ($timeout, $filter) {
	var uploadFile = {};
	uploadFile.init = function (type) {
		return {
			img: {
				limit: '',
				flag: '',
				page_init: function (number) {
					this.limit = number || 4;
					return  this.limit;
				},
				selfFunc: '',
				tempArr: [],
				obj_init: function (pathString) {
					 var that = this;
					var selfData = {
						option: {
							uploader: pathString,
							id: 'uploadImg',
							fileTypeExts: '*.jpg;*.gif;*.jpeg;*.png',
							onUploadSuccess: function (file, data, response) {
								that.selfFunc = this;
								var resData = JSON.parse(data);
								//给该文件赋值一个随机值
								resData.id = Math.ceil(Math.random() * 1000000000);
								resData.flag = true;
								$timeout(function () {
									that.tempArr.push(resData);
								}, 20);
							},
						},
						deleteUploadImg: function (id) {
							var stroreArr = [];
							angular.forEach(that.tempArr, function (r, d) {
								if (r.id == id) {
									that.tempArr.splice(d, 1);
								}
							});
							stroreArr = that.tempArr;
							//把successful_uploads长度设置为只有过滤后的选项
							that.selfFunc.setStats({
								successful_uploads: stroreArr.length
							});
							//文件没有打到最大的长度启用按钮
							if (stroreArr.length < that.limit) {
								that.selfFunc.setButtonDisabled(false);
							}
						}
					}
					return selfData
				}
			},
			file: {
				limit: '',
				page_init: function (number) {
					this.limit = number || 4;
					return this.limit;
				},
				selfFunc: '',
				tempArr: [],
				obj_init: function (pathString) {
					var that = this;
					var selfData = {
						option: {
							uploader: pathString,
							id: 'uploadImg',
							fileTypeExts: '*.doc;*.xls;*.pdf;*.ppt;*.docx,*.xlsx,*.pptx',
							onUploadSuccess: function (file, data, response) {
								that.selfFunc = this;
								var resData = JSON.parse(data);
								//给该文件赋值一个随机值
								resData.id = Math.ceil(Math.random() * 1000000000);
								resData.flag = true;
								$timeout(function () {
									that.tempArr.push(resData);
								}, 20);
							},
						},
						deleteUploadFile: function (id) {
							var stroreArr = [];
							angular.forEach(that.tempArr, function (r, d) {
								if (r.id == id) {
									that.tempArr.splice(d, 1);
								}
							});
							stroreArr = that.tempArr;
							//把successful_uploads长度设置为只有过滤后的选项
							that.selfFunc.setStats({
								successful_uploads: stroreArr.length
							});
							//文件没有打到最大的长度启用按钮
							if (stroreArr.length < that.limit) {
								that.selfFunc.setButtonDisabled(false);
							}
						}
					}
					return selfData
				}
			},
			video: {
				limit: '',
				page_init: function (number) {
					this.limit = number || 4;
					return this.limit;
				},
				selfFunc: '',
				tempArr: [],
				obj_init: function (pathString) {
					var that = this;
					var selfData = {
						option: {
							uploader: '/Bulletin/receiveAttachment',
							id: 'uploadVideo',
							fileTypeExts: '*.mp4;*.amr',
							fileSizeLimit: '5MB',
							onUploadSuccess: function (file, data, response) {
								that.selfFunc = this;
								var resData = JSON.parse(data);
								//给该文件赋值一个随机值
								resData.id = Math.ceil(Math.random() * 1000000000);
								resData.flag = true;
								$timeout(function () {
									that.tempArr.push(resData);
								}, 20);
							}
						},
						deleteUploadVideo: function (index) {
							var stroreArr = [];
							angular.forEach(that.tempArr, function (r, d) {
								if (r.id == id) {
									that.tempArr.splice(d, 1);
								}
							});
							stroreArr = that.tempArr;
							//把successful_uploads长度设置为只有过滤后的选项
							that.selfFunc.setStats({
								successful_uploads: stroreArr.length
							});
							//文件没有打到最大的长度启用按钮
							if (stroreArr.length < that.limit) {
								that.selfFunc.setButtonDisabled(false);
							}
						}
					}
					return selfData;
				},
			},
			current_type: '',
			set_type: function (type) {
				this.current_type = type;
				return type;
			},
			get_attachment: function () {
				var attach = {
					file: [],
					name: []
				};
				angular.forEach(this[this.current_type].tempArr, function (item) {
					attach.file.push(item.fileUrl);
					attach.name.push(item.pathinfo.basename);
				});
				return attach;
			},
			turn: function (type) {
				this[type].tempArr = [];
			},
			close: function () {
				this[this.current_type].tempArr = [];
			}

		}
	}
	return uploadFile;
})