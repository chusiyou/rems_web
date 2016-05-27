<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>表单验证提示效果</title>
<style type="text/css">
body {
	background:#FFF
}
h1{ font-size:20px;}
input{ border:#999999 1px solid; background-color:#FFFFEE}
.button2{ background-color:#FF9900; border-bottom:#E34A00 2px solid;border-right:#E34A00 2px solid; border-top:#FFB693 2px solid;border-left:#FFB693 2px solid; color:#FFFFFF; font-weight:bold}
dl {
font:normal 12px/15px Arial;
  position: relative;
    width: 350px;
}
dt {
    clear: both;
    float:left;
    width: 80px;
    padding: 4px 0 2px 0;
    text-align: left;
    
}
dd {
    float: left;
    width: 200px;
    margin: 0 0 8px 0;
    padding-left: 6px;
   
}

.hint {
display: none;
    position: absolute;
    right: -160px;
    width: 200px;
    margin-top: -4px;
    border: 1px solid #c93;
    padding: 10px 12px;
    background: #ffc url(http://www.codefans.net/jscss/demoimg/200911/pointer.gif) no-repeat -10px 5px;
}

.hint .hint-pointer {
    position: absolute;
    left: -10px;
    top: 5px;
    width: 10px;
    height: 19px;
    background: url(http://www.codefans.net/jscss/demoimg/200911/pointer.gif) left top no-repeat;
}
</style>
<script language="JavaScript" type="text/javascript">
var FormValid = function(frm) {
    this.frm = frm;
    this.errMsg = new Array();
	this.errName = new Array();
   
    this.required = function(inputObj) {
        if (typeof(inputObj) == "undefined" || inputObj.value.trim() == "") {
            return false;
        }
		return true;
    }
    
    this.eqaul = function(inputObj, formElements) {
		var fstObj = inputObj;
		var sndObj = formElements[inputObj.getAttribute('eqaulName')];
		
        if (fstObj != null && sndObj != null) {
            if (fstObj.value != sndObj.value) {
               return false;
            }
        }
		return true;
    }

    this.gt = function(inputObj, formElements) {
		var fstObj = inputObj;
		var sndObj = formElements[inputObj.getAttribute('eqaulName')];
		
        if (fstObj != null && sndObj != null && fstObj.value.trim()!='' && sndObj.value.trim()!='') {
            if (fstObj.value <= sndObj.value) {
                 return false;
            }
        }
		return true;
    }

	this.compare = function(inputObj, formElements) {
		var fstObj = inputObj;
		var sndObj = formElements[inputObj.getAttribute('objectName')];
        if (fstObj != null && sndObj != null && fstObj.value.trim()!='' && sndObj.value.trim()!='') {
            if (!eval('fstObj.value' + inputObj.getAttribute('operate') + 'sndObj.value')) {
                 return false;
            }
        }
		return true;
	}
	
	this.limit = function (inputObj) {
		var len = inputObj.value.length;
		if (len) {
			var minv = inputObj.getAttribute('min');
			var maxv = inputObj.getAttribute('max');
			minv = minv || 0;
			maxv = maxv || Number.MAX_VALUE;
			return minv <= len && len <= maxv;
		}
		return true;
	}
	
	this.range = function (inputObj) {
		var val = parseInt(inputObj.value);
		if (inputObj.value) {
			var minv = inputObj.getAttribute('min');
			var maxv = inputObj.getAttribute('max');
			minv = minv || 0;
			maxv = maxv || Number.MAX_VALUE;
		
			return minv <= val && val <= maxv;
		}
		return true;
	}
	
	this.requireChecked = function (inputObj) {
		var minv = inputObj.getAttribute('min');
		var maxv = inputObj.getAttribute('max');
		minv = minv || 1;
		maxv = maxv || Number.MAX_VALUE;
	
		var checked = 0;
		var groups = document.getElementsByName(inputObj.name);
		
		for(var i=0;i<groups.length;i++) {
			if(groups[i].checked) checked++;
			
		}
		return minv <= checked && checked <= maxv;
	}
	
	this.filter = function (inputObj) {
		var value = inputObj.value;
		var allow = inputObj.getAttribute('allow');
		if (value.trim()) {
			return new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, allow.split(/\s*,\s*/).join("|")), "gi").test(value);
		}
		return true;
	}
	
	this.isNo = function (inputObj) {
		var value = inputObj.value;
		var noValue = inputObj.getAttribute('noValue');
		return value!=noValue;
	}
    this.checkReg = function(inputObj, reg, msg) {
        inputObj.value = inputObj.value.trim();

        if (inputObj.value == '') {
            return;
        } else {
            if (!reg.test(inputObj.value)) {
				this.addErrorMsg(inputObj.name,msg);
			}
        }
    }

    this.passed = function() {
        if (this.errMsg.length > 0) {
            FormValid.showError(this.errMsg,this.errName);
            frt = document.getElementsByName(this.errName[0])[0];
			
			if (frt.type!='radio' && frt.type!='checkbox') {
				frt.focus();
			}
            return false;
        } else {
          return true;
        }
    }

    this.addErrorMsg = function(name,str) {
        this.errMsg.push(str);
		this.errName.push(name);
    }
	
    this.addAllName = function(name) {
		FormValid.allName.push(name);
    }
	
}
FormValid.allName = new Array();
FormValid.showError = function(errMsg) {
	var msg = "";
	for (i = 0; i < errMsg.length; i++) {
		msg += "- " + errMsg[i] + "\n";
	}

	alert(msg);
}
function validator(frm) {
	var formElements = frm.elements;
	var fv = new FormValid(frm);
	
	for (var i=0; i<formElements.length;i++) {
		var validType = formElements[i].getAttribute('valid');
		var errorMsg = formElements[i].getAttribute('errmsg');
		if (validType==null) continue;
		fv.addAllName(formElements[i].name);

		var vts = validType.split('|');
		var ems = errorMsg.split('|');
		for (var j=0; j<vts.length; j++) {
			var curValidType = vts[j];
			var curErrorMsg = ems[j];
			
			switch (curValidType) {
			case 'isNumber':
			case 'isEmail':
			case 'isPhone':
			case 'isMobile':
			case 'isIdCard':
			case 'isMoney':
			case 'isZip':
			case 'isQQ':
			case 'isInt':
			case 'isEnglish':
			case 'isChinese':
			case 'isUrl':
			case 'isDate':
			case 'isTime':
				fv.checkReg(formElements[i],RegExps[curValidType],curErrorMsg);
				break;
			case 'regexp':
				fv.checkReg(formElements[i],new RegExp(formElements[i].getAttribute('regexp'),"g"),curErrorMsg);
				break;
			case 'custom':
				if (!eval(formElements[i].getAttribute('custom')+'(formElements[i],formElements)')) {
					fv.addErrorMsg(formElements[i].name,curErrorMsg);
				}
				break;
			default :
				if (!eval('fv.'+curValidType+'(formElements[i],formElements)')) {
					fv.addErrorMsg(formElements[i].name,curErrorMsg);
				}
				break;
			}
		}
	}
	return fv.passed();
}
String.prototype.trim = function() {
	return this.replace(/^\s*|\s*$/g, "");
}
var RegExps = function(){};
RegExps.isNumber = /^[-\+]?\d+(\.\d+)?$/;
RegExps.isEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
RegExps.isPhone = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/;
RegExps.isMobile = /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/;
RegExps.isIdCard = /(^\d{15}$)|(^\d{17}[0-9Xx]$)/;
RegExps.isMoney = /^\d+(\.\d+)?$/;
RegExps.isZip = /^[1-9]\d{5}$/;
RegExps.isQQ = /^[1-9]\d{4,10}$/;
RegExps.isInt = /^[-\+]?\d+$/;
RegExps.isEnglish = /^[A-Za-z]+$/;
RegExps.isChinese =  /^[\u0391-\uFFE5]+$/;
RegExps.isUrl = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
RegExps.isDate = /^\d{4}-\d{1,2}-\d{1,2}$/;
RegExps.isTime = /^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}$/;
</script>
<script type="text/javascript">
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}

function prepareInputsForHints() {
	var inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++){
		// test to see if the hint span exists first
		if (inputs[i].parentNode.getElementsByTagName("span")[0]) {
			// the span exists!  on focus, show the hint
			inputs[i].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			// when the cursor moves away from the field, hide the hint
			inputs[i].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}
	// repeat the same tests as above for selects
	var selects = document.getElementsByTagName("select");
	for (var k=0; k<selects.length; k++){
		if (selects[k].parentNode.getElementsByTagName("span")[0]) {
			selects[k].onfocus = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			selects[k].onblur = function () {
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}
}
addLoadEvent(prepareInputsForHints);
</script>
<script type="text/javascript">
FormValid.showError = function(errMsg,errName) {
	for (key in FormValid.allName) {
		document.getElementById('errMsg_'+FormValid.allName[key]).innerHTML = '';
	}
	for (key in errMsg) {
		document.getElementById('errMsg_'+errName[key]).innerHTML = errMsg[key];
	}
}
</script>

</head>
<body>
<center>
<h1>患者信息增加</h1>
<form action="patient.do?method=addPatient" method="post" onsubmit="return validator(this)" al>
<dl>
	<dt><label for="name">姓名:</label></dt>
	<dd><input name="name" id="name"type="text" valid="required" errmsg="用户名不能为空!" />
	<span class="hint" id="errMsg_name">请输入姓名<span class="hint-pointer"></span></span>	</dd>

	<dt><label for="username">帐号:</label></dt>
	<dd><input name="username" id="username" type="text" valid="required" errmsg="用户名不能为空!" />
	<span class="hint" id="errMsg_name">注册帐号（只支持数字和字母,如:love,love520）<span class="hint-pointer"></span></span>	</dd>
	
	<dt><label for="password">密码：</label></dt>
	<dd><input name="password" id="password" type="password" valid="required" errmsg="密码不能为空!" />
	<span class="hint"  id="errMsg_password">请输入密码,请最少输入最少6位最多12位密码<span class="hint-pointer">    </span></span>	</dd>
	
	<dt><label for="password2">确认密码：</label></dt>
	<dd>
	<input name="password2" id="password2"　type="text" type="password" valid="eqaul" eqaulName="password" errmsg="两次密码不同!" />
	<span class="hint" id="errMsg_password2">请再输入一次上面的密码<span class="hint-pointer"></span></span>	</dd>
	
	<dt><label for="age">年龄:</label></dt>
	<dd><input name="age" id="age"type="text" valid="required|isEmail" errmsg="Email不能为空|Email格式不对!"/>
	<span class="hint" id="errMsg_email">请输入年龄<span class="hint-pointer"></span></span>	</dd>
	
	<dt><label for="sex">性别:</label></dt>
	<dd><select id="sex" name="sex" >
			<option value="男">男</option>
			<option value="女">女</option>
			</select>
		
	</dd>

	<dt><label for="year">生日:</label></dt>
	<dd><select id="year" name="year">
			<option value="1983">1983</option>
			<option value="1984">1984</option>
			<option value="1985">1985</option>
		</select>年<select name="m" id="m">
	      <option value="5">5</option>
	      <option value="6">6</option>
	      <option value="7">7</option>
	      <option value="12">12</option>
        </select>月<select name="d" id="d">
	      <option value="5">5</option>
	      <option value="6">6</option>
	      <option value="7">7</option>
	      <option value="12">12</option>
        </select>日<span class="hint">请输入你的生日<span class="hint-pointer"></span></span>      
	</dd>

	<dt><label for="marry">婚姻状况:</label></dt>
	<dd ><select id="marry" name="marry" style="float:left;margin-left: 12px;">
			<option value="未婚">未婚</option>
			<option value="已婚">已婚</option>
			</select>
		<span class="hint">请选择婚姻状况<span class="hint-pointer"></span></span>      
	</dd>

	<dt><label for="jg">籍贯:</label></dt>
	<dd><input name="jg" id="jg" type="text" valid="required" errmsg="没有填写QQ或MSN"/>	</dd>

	<dt><label for="job">职业:</label></dt>
	<dd><input name="job" id="job" type="text" valid="required|isMobile" errmsg="手机不能为空|手机格式不对!" /></dd>

	<dt><label for="address">地址或单位:</label></dt>
	<dd><input name="address" id="address" type="text" valid="required|isMobile" errmsg="手机不能为空|手机格式不对!" /></dd>

	<dt><label for="jws">既往史:</label></dt>
	<dd><textarea name="jws" id="jws" cols="30" rows="5"></textarea></dd>


	<dt><label for="gms">过敏史:</label></dt>
	<dd><textarea name="gms" id="gms" cols="30" rows="5"></textarea></dd>


	<dt><label for="bqzz">病情症状:</label></dt>
	<dd><textarea name="bqzz" id="bqzz" cols="30" rows="5"></textarea></dd>


	<dt><label for="bqfx">病情分析:</label></dt>
	<dd><textarea name="bqfx" id="bqfx" cols="30" rows="5"></textarea></dd>



	<dt class="button"></dt>
	<dd class="button"><input type="submit" name="Submit" value=" 提 交 " class="button2"/></dd>
</dl>
</form>
 </p>
</center>
</body>
</html>