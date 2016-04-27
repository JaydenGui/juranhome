/*++++++++++++++++++++++++++++++++++++++++++++
 * check browser's type & version 
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2016-04-19
 *+++++++++++++++++++++++++++++++++++++++++++++*/
  var BrowserDetect = {
      init: function () {
          this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
          this.version = this.searchVersion(navigator.userAgent) || this.searchVersion(navigator.appVersion) || "an unknown version";
          this.OS = this.searchString(this.dataOS) || "an unknown OS";
      },
      searchString: function (data) {
          for (var i=0;i<data.length;i++)	{
              var dataString = data[i].string;
              var dataProp = data[i].prop;
              this.versionSearchString = data[i].versionSearch || data[i].identity;
              if (dataString) {
                  if (dataString.indexOf(data[i].subString) != -1)
                      return data[i].identity;
              }
              else if (dataProp)
                  return data[i].identity;
          }
      },
      searchVersion: function (dataString) {
          var index = dataString.indexOf(this.versionSearchString);
          if (index == -1) return;
          return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
      },
      dataBrowser: [
          {
              string: navigator.userAgent,
              subString: "Chrome",
              identity: "Chrome"
          },
          { 	string: navigator.userAgent,
              subString: "OmniWeb",
              versionSearch: "OmniWeb/",
              identity: "OmniWeb"
          },
          {
              string: navigator.vendor,
              subString: "Apple",
              identity: "Safari",
              versionSearch: "Version"
          },
          {
              prop: window.opera,
              identity: "Opera",
              versionSearch: "Version"
          },
          {
              string: navigator.vendor,
              subString: "iCab",
              identity: "iCab"
          },
          {
              string: navigator.vendor,
              subString: "KDE",
              identity: "Konqueror"
          },
          {
              string: navigator.userAgent,
              subString: "Firefox",
              identity: "Firefox"
          },
          {
              string: navigator.vendor,
              subString: "Camino",
              identity: "Camino"
          },
          {		// for newer Netscapes (6+)
              string: navigator.userAgent,
              subString: "Netscape",
              identity: "Netscape"
          },
          {
              string: navigator.userAgent,
              subString: "MSIE",
              identity: "Explorer",
              versionSearch: "MSIE"
          },
          {
              string: navigator.userAgent,
              subString: "Gecko",
              identity: "Mozilla",
              versionSearch: "rv"
          },
          { 		// for older Netscapes (4-)
              string: navigator.userAgent,
              subString: "Mozilla",
              identity: "Netscape",
              versionSearch: "Mozilla"
          }
      ],
      dataOS : [
          {
              string: navigator.platform,
              subString: "Win",
              identity: "Windows"
          },
          {
              string: navigator.platform,
              subString: "Mac",
              identity: "Mac"
          },
          {
              string: navigator.userAgent,
              subString: "iPhone",
              identity: "iPhone/iPod"
          },
          {
              string: navigator.platform,
              subString: "Linux",
              identity: "Linux"
          }
      ]

  };

  function browserWarning(){
	  //调用方法 BrowserDetect.browser:为浏览器类型，BrowserDetect.version:为版本,BrowserDetect.OS:为系统类型
      BrowserDetect.init();
      var b = $.cookie("browsers");
      if(b != null )
    	  return;
      
      //Determine the version of Firefox 
      if(BrowserDetect.browser=="Firefox" && BrowserDetect.version >= 34)
    	  return;
      
      //Determine the version of Chrome
      if(BrowserDetect.browser=="Chrome" && BrowserDetect.version >= 47)
    	  return;
   
      $(".versioncue").show(); 
  }

  function untilGo(){
	if($('#ckBox').is(':checked')) 
		$.cookie('browsers', BrowserDetect.version, {expires: 3000, path: '/' });
	else
		$.cookie('browsers', BrowserDetect.version, {path: '/' });	
  }
          
          
  /**
   *versioncue 
   */
   function browserRedirect() {
          var sUserAgent = navigator.userAgent.toLowerCase();
          var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
      var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
      var bIsMidp = sUserAgent.match(/midp/i) == "midp";
      var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
      var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
      var bIsAndroid = sUserAgent.match(/android/i) == "android";
      var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
      var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
      var bIsMac = sUserAgent.match(/mac/i) == "mac";
      var chromeUrl;
      var uirefoxUrl;
      
      if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
          chromeUrl="http://www.google.cn/chrome/browser/mobile/";
      } else {
          chromeUrl="http://www.google.cn/chrome/browser/";
      }
      
      if(bIsIpad||bIsIphoneOs){
      	uirefoxUrl="http://www.firefox.com.cn/#ios";
      }else if(bIsAndroid){
      	uirefoxUrl="http://www.firefox.com.cn/#android";
      }else if(bIsMac){
      	uirefoxUrl="http://www.firefox.com.cn/download/#more";
      }else{
      	uirefoxUrl="http://www.firefox.com.cn/#desktop";
      }
      
      $("#Chrome").attr('href',chromeUrl);
      $("#Firefox").attr('href',uirefoxUrl);
  }
  
  $(function(){
      $("#butontal").click(function(){
          $(".versioncue").show();
      });
      $(".hideasi").click(function(){
          $(".versioncue").hide();
      });
  });