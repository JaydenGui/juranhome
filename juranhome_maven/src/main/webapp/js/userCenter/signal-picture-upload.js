/**
 * Created by Administrator on 2016/2/20 0020.
 */
var imgCount = 0;
var imagesSize = true;
function previewImage(file, type) {
	if (file.files && file.files[0]) {

		for (var i = 0; i < file.files.length; i++) {

			/*
			 * if(!file.files[i].type=="image/jpeg"||!file.files[i].type=="image/png"||!file.files[i].type=="image/gif"||!file.files[i].type=="image/gif"||file.files[i].type==''){
			 * alert("您上传的图片格式有误！请选择png、gif、jpg、bmp格式的图片"); return false; }
			 */

			if (file.files[i].size > 6 * 1048576) {
				alert(file.files[i].name + "　图片大小超标　("
						+ (file.files[i].size / 1048576) + "M)，请选小于6M的图片！");
				$('#designpage').val(null);
				imagesSize = false;

				// return false;

			} else {
				imgCount++;

				if (imgCount < 21) {
					var appendBolck = type == 1 ? "bp" : "bom";
					var appendName = type == 1 ? "designpage" : "designstuff";
					var PickedImg = new Image();
					var _URL = window.URL || window.webkitURL;
					PickedImg.setAttribute('src', _URL
							.createObjectURL(file.files[i]));

					var srcUrl = PickedImg.src;
					var srcFileName = file.files[i].name;

					if (type == 1) {
						$("#drawing")
								.before(
										'<li id="'
												+ srcFileName
												+ '" class="col-md-3 juran-building-img"><img width=100%  src='
												+ srcUrl + '  /></li>');
					} else {
						$("#material")
								.before(
										'<li id="'
												+ srcFileName
												+ '" class="col-md-3 juran-building-img"><img width=100%  src='
												+ srcUrl + '  /></li>');
					}

					var InputField = document.createElement("input");
					InputField.setAttribute("type", "file");
					InputField.setAttribute("id", appendName);
					InputField.setAttribute("name", appendName);
					InputField.setAttribute("onchange", "previewImage(this,"
							+ type + ")");
					InputField.setAttribute("multiple", "true");
					InputField
							.setAttribute("style",
									"position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0");

					$("#file_fields_" + appendBolck).append(InputField);
				} else {

					alert("单次上传图片不能超过20张，请保存后在上传！");
					return false;
				}
			}
		}
	}
}

$(function() {
	$("#back").click(function() {
		location.href = baseUrl + "/user/index#/my3DScheme/";
	});

	// To determine whether to upload pictures saved successfully
	var status = $.cookie("status");

	if (status < 400 && status != null) {
		$.cookie('status', null, {
			expires : 0
		});
		alert("保存成功！");
	} else if (status != null && status != "") {
		$.cookie('status', null, {
			expires : 0
		});
		alert("保存失败！");
	}

	$.cookie('status', null, {
		expires : 0
	});

	// Verification form submission
	$("#submit").click(function() {

		var drawingList = ",";
		var materialList = ",";
		$("#drawingList").children().each(function(i, n) {
			// if($(n).attr("id") != "case-uploading-img")fileList +=
			// $(n).attr("id") + ",";
			if ($(n).attr("id") && $(n).attr("id").indexOf(".") > -1)
				drawingList += $(n).attr("id") + ",";
		});

		$("#materialList").children().each(function(i, n) {
			// if($(n).attr("id") != "case-uploading-img")fileList +=
			// $(n).attr("id") + ",";
			if ($(n).attr("id") && $(n).attr("id").indexOf(".") > -1)
				materialList += $(n).attr("id") + ",";
		});

		$("#bp_list").val(drawingList);
		$("#bom_list").val(materialList);

		// if(!confirm("drawingList : " + drawingList + " <-> " + "materialList
		// : " + materialList))return false;

		if ($("#file_fields_bp").children().length > 1)
			$("#file_fields_bp :last-child").remove();
		if ($("#file_fields_bom").children().length > 1)
			$("#file_fields_bom :last-child").remove();
		if ($("#asset_id").val() == 0) {
			alert("请先创建3D设计方案后再上传！");
			return false;
		} else if ($("#designstuff").val() || $("#designpage").val()) {
			$("#form").submit();
		} else {
			alert("请选择图片后再保存！");
			return false;
		}
	});
});