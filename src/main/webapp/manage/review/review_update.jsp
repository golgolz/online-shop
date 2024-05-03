<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/jsp/user/lib.jsp" />
	<!-- golgolz start -->
	<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404251303" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRNbgMhDIX3M932HE5U5R6VegJgnMGKwQjDpLl9aVL1Z9uBHcboe9bTw-AlIKCbq2JWYDojG3t4ORwhVcvkZl8Cgy44L6i0RtALxeMJnCoEWSojWDF5gWumgq_GXcyKT637DP9Fs7lJLWCNkrvrOAlBYmfo46IzFN3UCpwqDQIXES6UBtE98ih0yi0sbpTfyawUTcFRrhs7iGxrKd2j_Q2X93GG8Ciz2zO3D72cWSRD4tpS0aop40Z4_TkNmrw1MO9j_1qrXzKhtg-vXtKbp5Qorr0FnMStMUhi2ul7kIxxuz00eiztv0DVT9oH&type=css&k=2ac0432e370996de85bc64830c9b818c88b32f75&t=1678165953&user=T"  />

<link rel="canonical" href="https://insideobject.com/board/product/write.html" />
<link rel="alternate" href="https://m.insideobject.com/board/product/write.html" />
	<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/jsp/user/header.jsp" />
	<div id="wrap">
		<div id="main">
			<!-- golgolz start -->
						<div>
<hr class="layout"/>
    

    <div id="container">
		<div id="contents">
		
<div class="titleArea">
            <h2><font color="#555555">REVIEW</font></h2>
            <p>상품 사용후기입니다.</p>
        </div>
</div>
<form id="boardWriteForm" name="" action="/exec/front/Board/write/4" method="post" target="_self" enctype="multipart/form-data" >
<input id="board_no" name="board_no" value="4" type="hidden"  />
<input id="product_no" name="product_no" value="6027" type="hidden"  />
<input id="move_write_after" name="move_write_after" value="/product/detail.html?board_no=4&amp;product_no=6027&amp;cate_no=428&amp;display_group=1&amp;keyword=" type="hidden"  />
<input id="cate_no" name="cate_no" value="428" type="hidden"  />
<input id="bUsePassword" name="bUsePassword" value="" type="hidden"  />
<input id="order_id" name="order_id" value="" type="hidden"  />
<input id="is_post_checked" name="is_post_checked" value="" type="hidden"  />
<input id="isExceptBoardUseFroalaImg" name="isExceptBoardUseFroalaImg" value="" type="hidden"  />
<input id="isGalleryBoard" name="isGalleryBoard" value="" type="hidden"  />
<input id="c6" name="c6" value="429218e799694a4b1ce711e01de9690d" type="hidden"  /><div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4"><!--
            $write_success_url = /board/product/list.html
            $product_select_url = /product/search_board_list.html
            $order_select_url = /order/search_board_list.html
            $login_page_url = /member/login.html
            $deny_access_url = /index.html
        -->
<div class="ec-base-box typeProduct  ">
            <p class="thumbnail"><a href=""><img id="iPrdImg" src="https://insideobject.com/web/product/tiny/202305/4af17b2f7283ac768912d392d44d09ca.png" onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'" alt=""/></a></p>
            <div class="information" style="padding-left:30px">
				<h3><a href="https://insideobject.com/product/detail.html?product_no=6027" id="aPrdNameLink">
				<span id="sPrdName">[오브젝트] 오브젝트 2023 로고키링</span></a></h3>
                <p class="price"><span id="sPrdPrice">6,500원</span> <span id="sPrdTaxText"></span></p>
                <p class="button">
                    <span id="iPrdView" class=""><a href="https://insideobject.com/product/detail.html?product_no=6027" id="aPrdLink" class="btnEm" target="_blank">상품상세보기</a></span>
                    <span class="displaynone"><a href="#none" class="btnNormal" onclick="BOARD_WRITE.product_popup('/product/search_board_list.html')">상품정보선택</a></span>
                    <span class=""><a href="#none" class="btnNormal" onclick="BOARD_WRITE.product_popup('/order/search_board_list.html')">주문상품선택</a></span>
                </p>
            </div>
        </div>
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
                    <td> <input id="subject" name="subject" fw-filter="isFill" fw-label="제목" fw-msg="" class="inputTypeText" placeholder="" maxLength="125" value="수정할 제목" type="text"  /></td>
                </tr>
<tr class="displaynone">
<th scope="row">작성자</th>
                    <td></td>
                </tr>
<tr class="displaynone">
<!-- <th scope="row">이메일</th>
                    <td></td>
                </tr> -->
<!-- <tr class="displaynone">
<th scope="row">평점</th>
                    <td><input id="point0" name="point" fw-filter="" fw-label="평점" fw-msg="" value="5" type="radio" checked="checked"  /><label for="point0" ><span class="point5"><em>★★★★★</em></span></label>
<input id="point1" name="point" fw-filter="" fw-label="평점" fw-msg="" value="4" type="radio"  /><label for="point1" ><span class="point4"><em>★★★★</em></span></label>
<input id="point2" name="point" fw-filter="" fw-label="평점" fw-msg="" value="3" type="radio"  /><label for="point2" ><span class="point3"><em>★★★</em></span></label>
<input id="point3" name="point" fw-filter="" fw-label="평점" fw-msg="" value="2" type="radio"  /><label for="point3" ><span class="point2"><em>★★</em></span></label>
<input id="point4" name="point" fw-filter="" fw-label="평점" fw-msg="" value="1" type="radio"  /><label for="point4" ><span class="point1"><em>★</em></span></label></td>
                </tr> -->
<tr>
<td colspan="2" class="clear">
                        
            <!-- CSS -->
            <link rel="stylesheet" href="https://img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2404180600">
            <link rel="stylesheet" href="https://img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2404180600">

            <!-- HTML -->
            <textarea style="width: 100%;" name="content" id="content" class="ec-fr-never-be-duplicated">수정할 내용</textarea>
                <input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE" />
                
            <!-- JavaScript -->
            <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2404180600"></script>
            <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2404180600"></script>
            <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2404180600"></script>
        
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
                    var o = {"key":"DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==","toolbarSticky":false,"theme":"ec-froala","attribution":false,"htmlRemoveTags":["script"],"htmlAllowedEmptyTags":["*"],"iframe":true,"iframeStyle":".fr-view{font-size: 12px;}","iframeStyleFiles":["\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2404171300"],"heightMin":400,"language":"ko_KR","paragraphFormatSelection":true,"fontFamilySelection":true,"fontSize":["8","9","10","12","14","16","18","20","22","24","26","28","30"],"fontSizeSelection":true,"linkInsertButtons":["linkBack"],"quickInsertButtons":["ul","ol","hr"],"codeMirror":false,"entities":"&#60;&#62;","imageEditButtons":["imageAlign","imageRemove","|","imageLink","linkOpen","linkEdit","linkRemove","-","imageDisplay","imageStyle","imageAlt","imageSize"],"tableEditButtons":[],"tableInsertHelper":false,"imageDefaultMargin":0,"imageDefaultWidth":0,"imageUpload":false,"imageInsertButtons":["imageUpload"],"imageMaxSize":5242880,"filesManagerMaxSize":5242880,"toolbarButtons":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":5},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":5},"moreRich":{"buttons":["insertTable","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsSM":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":4},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":2},"moreRich":{"buttons":["insertTable","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsXS":{"moreText":{"buttons":["paragraphFormat","textColor","backgroundColor","bold","italic","underline","strikeThrough"],"buttonsVisible":1},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight"],"buttonsVisible":0},"moreRich":{"buttons":["insertLink"]},"moreMisc":{"buttons":["undo","redo","html"],"buttonsVisible":0,"align":"right"}},"htmlDoNotWrapTags":["script","style","meta","link"],"htmlAllowedStyleProps":[".*"],"htmlAllowedTags":[".*"],"htmlAllowedAttrs":[".*"],"fontFamily":{"Dotum,sans-serif":"Dotum","Gulim,sans-serif":"Gulim","Batang,sans-serif":"Batang","Gungsuh,sans-serif":"Gungsuh","Arial,Helvetica,sans-serif":"Arial","Tahoma,Geneva,sans-serif":"Tahoma","Verdana,Geneva,sans-serif":"Verdana","Fixedsys,sans-serif":"Fixedsys","'Times New Roman',Times,serif":"Times New Roman","helvetica,sans-serif":"Helvetica","sans-serif":"Sans-serif","palatino,sans-serif":"Palatino","'Comic Sans MS',sans-serif":"Comic Sans MS","sand,sans-serif":"Sand","'Courier New',sans-serif":"Courier New","courier,sans-serif":"Courier","monospace,sans-serif":"Monospace","Georgia,serif":"Georgia","SimSun,sans-serif":"SimSun","SimHei,sans-serif":"SimHei","'MS PGothic',sans-serif":"MS PGothic","'MS PMincho',sans-serif":"MS PMincho","'MS UI PGothic',sans-serif":"MS UI PGothic","Meiryo,sans-serif":"Meiryo"},"colorsText":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"colorsBackground":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"docId":"content"};
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
                        script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2404171300";
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
            
            // \n 제거되는 사양에대한 대응 : 코드뷰 토글시 줄바꿈 태그 \n으로 변경
            function removeFroalaNewLine(oEditor) {
                if (oEditor.codeView.isActive() === false) {
                    return;
                }
                
                var sCodeViewValue;
                if (typeof oEditor.opts.codeMirror === "function") {
                    // 상품 등록/수정 에디터는 코드미러를 사용하기때문에 분기처리
                    sCodeViewValue = oEditor.$wp.get(0).querySelector(".CodeMirror").CodeMirror.getValue();
                    oEditor.$wp.get(0).querySelector(".CodeMirror").CodeMirror.setValue(sCodeViewValue.replace(/<span class=[',"]fr-newline[',"]><\/span>/g, '\n'));
                } else {
                    sCodeViewValue = oEditor.$wp.get(0).querySelector(".fr-code").value;
                    oEditor.$wp.get(0).querySelector(".fr-code").value = sCodeViewValue.replace(/<span class=[',"]fr-newline[',"]><\/span>/g, '\n');
                }
            }
            
            </script>                    </td>
                </tr>
</tbody>
</table>
</div>
<div class="ec-base-button ">
            <span class="gLeft">
                <span class="displaynone"><a href="#none" class="btnNormal sizeS" onclick="">관리자 답변보기</a></span>
                <a href="http://localhost/online-shop/manage/review/review_my.jsp" class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gRight">
                <a href="http://localhost/online-shop/manage/review/review_my.jsp" class="btnSubmitFix sizeS" onclick="BOARD_WRITE.form_submit('boardWriteForm');">수정</a>
                <a href="/board/review/4/" class="btnBasicFix sizeS">취소</a>
            </span>
        </div>
</div>
			<!-- golgolz end -->
		</div>
	</div>
</body>
</html>