<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../assets/jsp/admin/lib.jsp" />

<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404180600" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733" />
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRBbsQgDEX3k257Ds-o6j0q9QTEcYI1gBGGTOf2dTtVq64DO8DwvvX1MXiJBIRTUyoKgVcKbj6_nC-Q2xwYJ19jAF1oWkh5S6BXTpdXQFWIsrRAMIsriz3V-ubw6jZ6suIzdCMruYK-MxRdpSh7717XlrCypGPY4O7SKsxOGb81UGLsDn0cdIYSnmxDp8aDwFUkVM6D6J7CKHQuFhQc5Xd2GyfL9CjX3TyIPLdau0f7Fy4f4wwJo8y2a3gMvaxBpEAOzVJhu1Ohnen2txrUuRWodBupPzKx2YdXL_ndc86ctt4CKGk3ho3tfND3KIXSfn9o9Bja_4GqX7RP&type=css&k=d664d08dad9a7052b47cd7d6e8a0a70935bed9eb&t=1678165953&user=T" />
<script type="text/javascript">
	$(function(){
    	$("#notice_menu").addClass("bg-gradient-primary");
	});
</script>

<!-- golgolz start -->
<!-- golgolz end -->

</head>
<style type="text/css">
	.txt_01{text-align:center}
	.txt_02{text-align:center}
	#table_01{margin: auto ; border:1px solid #b3b3b3}
	th{background-color: #F5F5F5; text-align:center}
	.btnInsert{float:right}
</style>
<body>
	<jsp:include page="../../assets/jsp/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">공지사항 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">공지사항 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="container">
		<div id="contents">
		
<!-- <div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 "><div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><div class="path">
            <span>현재 위치</span>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>공지사항</strong></li>
            </ol>
</div> -->
<div class="titleArea" style="padding-top : 3px ">
            <h2><font color="333333">공지사항</font></h2>
            <p>공지사항 작성</p>
        </div>
</div>
<form id="boardWriteForm" name="" action="/exec/front/Board/write/6" method="post" target="_self" enctype="multipart/form-data" >
<input id="board_no" name="board_no" value="6" type="hidden"  />
<input id="product_no" name="product_no" value="0" type="hidden"  />
<input id="move_write_after" name="move_write_after" value="/board/product/list.html?board_no=6" type="hidden"  />
<input id="cate_no" name="cate_no" value="" type="hidden"  />
<input id="bUsePassword" name="bUsePassword" value="" type="hidden"  />
<input id="order_id" name="order_id" value="" type="hidden"  />
<input id="is_post_checked" name="is_post_checked" value="" type="hidden"  />
<input id="isExceptBoardUseFroalaImg" name="isExceptBoardUseFroalaImg" value="" type="hidden"  />
<input id="isGalleryBoard" name="isGalleryBoard" value="" type="hidden"  />
<input id="e40b23d9be354701bd536cf4bbd" name="e40b23d9be354701bd536cf4bbd" value="2668c132a05cbe37b354dc6da39a85e8" type="hidden"  /><div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4"><!--
            $write_success_url = /board/product/list.html
            $product_select_url = /product/search_board_list.html
            $order_select_url = /order/search_board_list.html
            $login_page_url = /member/login.html
            $deny_access_url = /index.html
        -->

<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>글쓰기 폼</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<tr>
<th scope="row">제목</th>
                    <td><select id="board_category" name="board_category" fw-filter="" fw-label="" fw-msg=""  >
<option value="1">선택</option>
<option value="2">공지사항</option>
</select> <input id="subject" name="subject" fw-filter="isFill" fw-label="제목" fw-msg="" class="inputTypeText" placeholder="" maxLength="125" value="" type="text"  />  </td>
                </tr>
<tr class="displaynone">
<th scope="row">작성자</th>
                    <td></td>
                </tr>
<tr class="displaynone">
<th scope="row">이메일</th>
                    <td></td>
                </tr>
<tr class="displaynone">
<th scope="row">평점</th>
                    <td></td>
                </tr>
<tr>
<td colspan="2" class="clear">
                        
            <!-- CSS -->
            <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2404210600">
            <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2404210600">

            <!-- HTML -->
            <textarea style="width: 100%;" name="content" id="content" class="ec-fr-never-be-duplicated"></textarea>
                <input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE" />
                
            <!-- JavaScript -->
            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2404210600"></script>
            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2404210600"></script>
            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2404210600"></script>
        
            <script>
                if (FroalaEditor.PLUGINS && FroalaEditor.PLUGINS.url) delete FroalaEditor.PLUGINS.url; // ECHOSTING-518735
            </script>
        
            <!-- Run Froala Script -->
            <script>
              var EC_FROALA_ID = null;
              // isSimplexEditorFill 체크시에 필요함
              var EC_FROALA_INSTANCE = null;
              // scroll 버그 대응을 위해 필요.
              var fScrollPosition = 0;
              // 다중 이미지 삽입시 생기는 버그 대응
              var iCheckedImageListCount  = 0;
              var aCheckedImageList = [];
              var aInsertedImageList = [];
              var isBeforeImageRemove = false;
              
              (function() {
                var d = "";
                try {
                    var o = {"key":"DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==","toolbarSticky":false,"theme":"ec-froala","attribution":false,"htmlRemoveTags":["script"],"htmlAllowedEmptyTags":["*"],"iframe":true,"iframeStyle":".fr-view{font-size: 12px;}","iframeStyleFiles":["\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2404210600"],"heightMin":400,"language":"ko_KR","paragraphFormatSelection":true,"fontFamilySelection":true,"fontSize":["8","9","10","12","14","16","18","20","22","24","26","28","30"],"fontSizeSelection":true,"linkInsertButtons":["linkBack"],"quickInsertButtons":["ul","ol","hr"],"codeMirror":false,"entities":"&#60;&#62;","imageEditButtons":["imageAlign","imageRemove","|","imageLink","linkOpen","linkEdit","linkRemove","-","imageDisplay","imageStyle","imageAlt","imageSize"],"tableEditButtons":[],"tableInsertHelper":false,"imageDefaultMargin":0,"imageDefaultWidth":0,"imageUpload":false,"imageInsertButtons":["imageUpload"],"imageMaxSize":5242880,"filesManagerMaxSize":5242880,"toolbarButtons":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":5},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":5},"moreRich":{"buttons":["insertTable","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsSM":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":4},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":2},"moreRich":{"buttons":["insertTable","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsXS":{"moreText":{"buttons":["paragraphFormat","textColor","backgroundColor","bold","italic","underline","strikeThrough"],"buttonsVisible":1},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight"],"buttonsVisible":0},"moreRich":{"buttons":["insertLink"]},"moreMisc":{"buttons":["undo","redo","html"],"buttonsVisible":0,"align":"right"}},"htmlDoNotWrapTags":["script","style","meta","link"],"htmlAllowedStyleProps":[".*"],"htmlAllowedTags":[".*"],"htmlAllowedAttrs":[".*"],"fontFamily":{"Dotum,sans-serif":"Dotum","Gulim,sans-serif":"Gulim","Batang,sans-serif":"Batang","Gungsuh,sans-serif":"Gungsuh","Arial,Helvetica,sans-serif":"Arial","Tahoma,Geneva,sans-serif":"Tahoma","Verdana,Geneva,sans-serif":"Verdana","Fixedsys,sans-serif":"Fixedsys","'Times New Roman',Times,serif":"Times New Roman","helvetica,sans-serif":"Helvetica","sans-serif":"Sans-serif","palatino,sans-serif":"Palatino","'Comic Sans MS',sans-serif":"Comic Sans MS","sand,sans-serif":"Sand","'Courier New',sans-serif":"Courier New","courier,sans-serif":"Courier","monospace,sans-serif":"Monospace","Georgia,serif":"Georgia","SimSun,sans-serif":"SimSun","SimHei,sans-serif":"SimHei","'MS PGothic',sans-serif":"MS PGothic","'MS PMincho',sans-serif":"MS PMincho","'MS UI PGothic',sans-serif":"MS UI PGothic","Meiryo,sans-serif":"Meiryo"},"colorsText":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"colorsBackground":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"docId":"content"};
                    // IE tableEditbuttons 이슈
                    o["tableEditButtons"] = FroalaEditor.DEFAULTS.tableEditButtons.filter(function(tableEditButtonName) {
                        return tableEditButtonName.indexOf("Style") === -1;
                    });

                    o["events"] = {
                        "filesManager.beforeUpload": function(files) {
                            this.opts.filesManagerUploadURL = getConvertUrlBeforeUpload(this.opts.filesManagerUploadURL);
                        },
                        "image.beforeUpload": function(images) {
                            this.opts.imageUploadURL = getConvertUrlBeforeUpload(this.opts.imageUploadURL);
                        },

                        "image.inserted": function(oImage, response) {
                            var sInstanceId = "content";
                            // 파일업로더로 이미지가 넘어오는경우에는 itslog가 이미 생성된 이미지기때문에 처리하지않음.
                            if ((sInstanceId === "product_description" || sInstanceId === "product_description_mobile") && typeof response !== "undefined") {
                                oImage.attr("data-use_its", true);
                            }
                           
                            if (iCheckedImageListCount >= 0) {
                                iCheckedImageListCount++;
                                aInsertedImageList.push(oImage);
                                
                                if (aCheckedImageList.length === iCheckedImageListCount || aCheckedImageList.length === 0) {
                                    // 마지막 이미지
                                    for (var i = 0; i < aInsertedImageList.length; i++) {
                                        aInsertedImageList[i].after("<br>");
                                    }
                                    
                                    // 리셋
                                    iCheckedImageListCount = 0;
                                    aCheckedImageList = [];
                                    aInsertedImageList = [];
                                }
                            }
                        },
                        "image.error": function (error, response) {
                            if (typeof JSON != "undefined") {
                                r = JSON.parse(response);
                                alert(r["error"]);
                            }
                        },
                        "image.loaded": function($img) {
                            // IE에서 이미지 로드 후, 커서 위치 재조정
                            if (/(trident).+rv[:\s]([\w\.]{1,9}).+like\sgecko/i.test(navigator.userAgent)) {
                                var _this = this;
                                var _img = $img[0];
                                setTimeout(function() {
                                  _this.selection.setAfter(_img);
                                  _this.selection.restore();
                                }, 300);
                            }
                        },
                        "filesManager.error": function (error, response) {
                            if (typeof JSON != "undefined") {
                                r = JSON.parse(response);
                                alert(r["error"]);
                            }
                        },
                        "commands.before": function(sCommand) {
                            // 코드뷰 토글시
                            if (sCommand === "html") {
                                var sContent = this.el.innerHTML;
                                sContent = sContent.replace(/<\/?null>/gi, "");
                                this.el.innerHTML = getReplaceZeroWidthSpace(sContent);
                                replaceToFroalaNewLine(this);
                            }
                            
                            // 전체화면 모드 켜기
                            if (sCommand === "fullscreen" && !this.fullscreen.isActive()) {
                                this.$box[0].setAttribute("data-window-scroll-y", window.scrollY || window.pageYOffset);
                            }
                            // 다중 이미지 삽입
                            if (sCommand === "insertAll") {
                                var popup = this.popups.get("filesManager.insert");
                                aCheckedImageList = popup.find(".fr-files-checkbox .fr-file-insert-check:checked")
                            }

                            if (sCommand === "insertSpecialCharacter") {
                                setScrollPosition(this, getIframeCursorPoint(this));
                            }
                        },
                        "commands.after": function(sCommand) {
                            if (sCommand === "html") {
                                removeFroalaNewLine(this);
                            }
                            
                            if (sCommand === "insertFiles") {
                                var enableButton= document.querySelector(".fr-trim-button.fr-plugins-enable");
                                if (enableButton) enableButton.click();
                            }
                            
                            if (sCommand === "selectAll") {
                                this.el.focus();
                            }
                            
                            // 전체 화면 토글시에 컨텐츠 높이를 정상적으로 반영하지못하는 이슈 대응
                            if (sCommand === "fullscreen") {
                                var _this = this;
                                setTimeout(function() {
                                    _this.size.syncIframe();
                                }, 300);
                                
                                if (this.fullscreen.isActive() === false) {
                                    window.scrollTo(0, this.$box[0].getAttribute("data-window-scroll-y"));
                                }
                            }
                            
                            if (sCommand === "insertSpecialCharacter") {
                                this.$wp.get(0).scrollTop = fScrollPosition;
                            }
                        },
                        "focus": function() {
                            if (this.iframe_document) {
                                var iframeHeight = this.iframe_document.body.scrollHeight;
                                this.$iframe[0].style.height = iframeHeight + "px";
                            }
                            
                            this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
                        },

                        "image.beforeRemove": function(aImage) {
                            isBeforeImageRemove = true;
                            var cursorPoint = aImage[0].offsetTop; // 제거 대상 이미지의 offsetTop 값으로 정의
                            setScrollPosition(this, cursorPoint);
                        },
                        "image.removed": function() {
                            if (isBeforeImageRemove === true) {
                                this.$wp.get(0).scrollTop = fScrollPosition; // 에디터 자체 버그동작이 수행 된 후 계산 해 둔 값으로 스크롤 위치를 이동
                            }
                            isBeforeImageRemove = false;
                        },
                        "keydown": function(e) {
                            if (isScrollFix(this, e) === true) {
                                setScrollPosition(this, getIframeCursorPoint(this));
                            }
                        },
                        "keyup": function(e) {
                            if (isScrollFix(this, e) === true) {
                                this.$wp.get(0).scrollTop = fScrollPosition;
                            }
                        },
                        "paste.before": function() {
                            if (this.fullscreen.isActive() === false) {
                                setScrollPosition(this, getIframeCursorPoint(this));
                            } 
                        },
                        "paste.after": function(e) {
                            if (this.fullscreen.isActive() === false) {
                                this.$wp.get(0).scrollTop = fScrollPosition;
                            } 
                        },
                        "codeView.update": function() {
                            this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
                            this.el.innerHTML = decodeUriAttribute(this.el.innerHTML);
                        }
                    };

                    EC_FROALA_INSTANCE = new FroalaEditor("textarea#content.ec-fr-never-be-duplicated", o, function() {
                        EC_FROALA_ID = this.id;
                        if (d != "") {
                            this.el.innerHTML = this.clean.html(d);
                            // 타겟 textarea 태그에 change 트리거링
                            this.undo.saveStep();
                        }
                        var script = document.createElement("script");
                        script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2404210600";
                        this.$iframe.get(0).contentWindow.document.head.appendChild(script);
                        if (this.el.innerHTML === "<br>") {
                            this.el.innerHTML = "<p><br></p>";
                        }
                    });

                    EC_FROALA_INSTANCE.$iframe[0].setAttribute("id", "content" + "_IFRAME");
                    EC_FROALA_INSTANCE.$iframe[0].contentWindow.document.body.setAttribute("id", "content" + "_BODY");

                    EC_FROALA_INSTANCE.isEmptyContent = function () {
                        var c = getContentFromFroala(this.id);
                        // 스페이스바만 입력 저장시, validation을 위해 처리
                        var val = c.replace(/\<br\/?\>|\<\/?p\>|\s|&nbsp;/gi, "");
                        if ("" == val) return true;
                        return false;
                    };

                    EC_FROALA_INSTANCE.getContentFromFroala = function() {
                        return getContentFromFroala(this.id);
                    };

                    EC_FROALA_INSTANCE.applyContentToFroala = function(content) {
                        return applyContentToFroala(content, this.id);
                    };

                    EC_FROALA_INSTANCE.setValueBeforeSubmit = function(sSection) {
                        return setValueBeforeSubmit(sSection, this.id);
                    };

                    if (typeof $Editor ===  "undefined") {
                        $Editor = {};
                    }
                    $Editor["content"] = EC_FROALA_INSTANCE;
                } catch (e) {
                    document.getElementById("content").value = d;
                    console.error(e);
                } finally {
                }
              })();
              
              function decodeUriAttribute(content) {
                  return content.replace(/(?:href=|src=)(?:"([^"]+)|'([^']+))[^>]/g, function (match, p1, p2) {
                      var p = p1 ? p1 : p2;
                      if (/%20|\s|%3A/g.test(p)) {
                          try {
                              return match.replace(p, decodeURIComponent(p).trim());
                          } catch (e) {
                              return match;
                          }
                      } else {
                          return match;
                      }
                  });
              }

              //플로알라 에디터 내용 조회
              function getContentFromFroala(id) {
                  try {
                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
                      return instance.id === sFroalaId;
                    });
                    if (oEditor[0].codeView.isActive()) {
                      oEditor[0].codeView.toggle();
                    }

                    oEditor[0].el.innerHTML = decodeUriAttribute(oEditor[0].el.innerHTML);
                    
                    return oEditor[0].el.innerHTML;

                  } catch (e) {
                    console.error(e);
                    return false;
                  }
              }

              //플로알라 에디터 내용 적용
              function applyContentToFroala(content, id) {
                  try {
                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
                      return instance.id === sFroalaId;
                    });

                    oEditor[0].el.innerHTML = oEditor[0].clean.html(content);

                    // textarea 태그에 change 트리거링
                    oEditor[0].undo.saveStep();
                    return true;
                  } catch (e) {
                    console.error(e);
                    return false;
                  }
              }

              // useclasses 옵션 사용시, froala 커스텀 속성값 (fr-draggable) 제거
              function setValueBeforeSubmit(sSection, id) {
                try {
                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
                      return instance.id === sFroalaId;
                    });

                    var contents = oEditor[0].el.innerHTML;
                    document.getElementById(sSection).value = contents.replace(/\sclass=("|')fr-draggable("|')|\s?fr-draggable\s?|<\/?null>/gi, "");

                    return true;
                  } catch (e) {
                    console.error(e);
                    return false;
                  }
              }

              //플로알라 front reset CSS 가져오기
              //Deprecated
              function getFroalaResetCSS() {
                return "//img.echosting.cafe24.com/editors/froala/css/froala_editor_reset.css?vs=2404210600;"
              }

              //플로알라 front style CSS 가져오기
              function getFroalaStyleCSS() {
                return "//img.echosting.cafe24.com/editors/froala/css/froala_style.min.css?vs=2404210600";
              }

              //플로알라 front style EC CSS 가져오기
              function getFroalaECStyleCSS() {
                return "//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404210600";
              }

              // 파일 업로드시 랜덤한 파라미터 값 추가
              function getConvertUrlBeforeUpload(sUploadUrl) {
                var aSplitUrl = sUploadUrl.split("?");
                var oParam = getParameterUploadUrl(aSplitUrl[1]);

                return decodeURIComponent(aSplitUrl[0] + "?" + "uploadPath=" + oParam["uploadPath"] + "&uploadId=" + Math.floor((Math.random() * 100000)).toString());
              }

             function getParameterUploadUrl(sQueryString) {
                var aParam = {};

                if (sQueryString) {
                    var aFields = sQueryString.split("&");
                    var aField  = [];
                    for (var i=0; i<aFields.length; i++) {
                        aField = aFields[i].split("=");
                        aParam[aField[0]] = aField[1];
                    }
                }
                return aParam;
            }

            // 스크롤 위치 수정해야하는지 확인
            function isScrollFix (oEditor, event) {
                if (oEditor.fullscreen.isActive() === true) {
                    return false;
                }
                var sKey = event.key.toUpperCase();
                var bResult = false;
                if (sKey === "ENTER") {
                    // 구문의 중간 지점의 엔터 입력만 요구 조건에 해당함
                    bResult = oEditor.selection.get().focusNode !== oEditor.$el.get(0);
                } else if (sKey === "BACKSPACE" || sKey === "DELETE") {
                    bResult = true;
                }
                return bResult;
            }
            
            // 스크롤 위치 수정
            function setScrollPosition (oEditor, fCursorPoint) {
                var oContentWrapper = oEditor.$wp.get(0); // 에디터 편집 영역 컨테이너
                var fStartPoint = oContentWrapper.scrollTop; // 보여지는 편집 영역의 시작 지점
                var fEndPoint = oContentWrapper.scrollTop + (oContentWrapper.clientHeight - 20); // 보여지는 편집 영역의 끝 지점 (여백 포함)
 
                if (fCursorPoint > 0 && fCursorPoint < fStartPoint) {
                    // 커서가 보여지는 영역보다 위에 위치
                    fScrollPosition = fCursorPoint;
                } else if (fCursorPoint > 0 && fCursorPoint > fEndPoint) {
                    // 커서가 보여지는 영역보다 아래에 위치
                    fScrollPosition = fCursorPoint - (oContentWrapper.clientHeight - 20); // 여백 포함
                } else {
                    // 값이 0 이라서 무효화 됐거나, 보여지는 영역에 있는 경우 - 위치를 그대로 유지
                    fScrollPosition = fStartPoint;
                }
            }
            
            // 커서 포인트 반환
            function getIframeCursorPoint(editor) {
                var iframeDocument = editor.$iframe.get(0).contentDocument;
                var anchorNode = iframeDocument.getSelection().anchorNode;
                var iframeRange = iframeDocument.createRange();
                iframeRange.selectNode(anchorNode);
                return iframeRange.getBoundingClientRect().top;
            }
   
            // 폭없는 공백에서 폭과 줄바꿈 없는 공백으로 치환 (폭없는 공백은 플로알라버그로인해 지원하지않음)
            function getReplaceZeroWidthSpace(sContent) {
                return sContent.replace(/\u200B/g, "&#65279;");
            }
            
            // \n 제거되는 사양에대한 대응 : 플로알라에서 코드뷰 토글시 줄바꿈되는 태그로 변경
            function replaceToFroalaNewLine(oEditor) {
                if (oEditor.codeView.isActive() === true) {
                    return;
                }
                
                var oWhiteSpacePreElements = oEditor.$el.get(0).querySelectorAll('*[style*="white-space: pre"], *[style*="white-space:pre"]');
                for (var iIndex = 0; iIndex < oWhiteSpacePreElements.length; iIndex++) {
                    oWhiteSpacePreElements[iIndex].innerHTML = oWhiteSpacePreElements[iIndex].innerHTML.replace(/\n/g, '<span class="fr-newline"></span>');
                }
            }            
            
           
            
            </script>                    </td>
                </tr>
</tbody>
<tbody class="">
<!-- <tr>
<th scope="row">첨부파일</th>
                    <td><input name="attach_file[]" type="file"  /></td>
                </tr> -->

</tbody>

</table>
</div>
<div class="ec-base-button ">
            <span class="gLeft">
                <span class="displaynone"><a href="#none" class="btnNormal sizeS" onclick="">관리자 답변보기</a></span>
                <a href="notice.jsp" class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gRight">
                <a href="#none" class="btnSubmitFix sizeS" onclick=";">등록</a>
                <a href="notice.jsp" class="btnBasicFix sizeS">취소</a>
            </span>
        </div>
</div>
</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>