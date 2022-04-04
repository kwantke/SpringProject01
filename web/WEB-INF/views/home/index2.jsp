<%--
  Created by IntelliJ IDEA.
  User: kokk7
  Date: 2022-02-19
  Time: 오후 8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <%--<link href="http://175.123.92.153:8090/common/css/video2-js.min.css" rel="stylesheet">--%>
    <link href="https://vjs.zencdn.net/7.18.1/video-js.css" rel="stylesheet" />
    <%--<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />--%>

<%--    <script src="https://vjs.zencdn.net/7.10.2/video.min.js"></script>--%>
  <%--  <script src="/resources/js/videojs-contrib-hls.js"></script>--%>

    <%--<script src="http://175.123.92.153:8090/common/js/video2.min.js"></script>--%>
    <%--<script src="http://175.123.92.153:8090/common/js/videojs2-contrib-hls.js"></script>--%>

</head>
<body>
<video id="mainVideo" class="video-js vjs-default-skin vjs-tech vjs-big-play-button vjs-big-play-centered vjs-16-9" width="100%" height="100%" controls preload="metadata" playsinline webkit-playsinline="">
   <%--<source src="https://cdntv.tbs.seoul.kr/tbs/_definst_/tbs_tv_mobile_360.smil/playlist.m3u8" type="application/x-mpegurl"/>--%>
</video>
<video
        id="my-video"
        class="video-js"
        controls
        preload="auto"
        width="640"
        height="264"

        data-setup="{}"
>
    <source src="https://cdntv.tbs.seoul.kr/tbs/_definst_/tbs_tv_mobile_360.smil/playlist.m3u8" type="application/x-mpegURL" />

    <p class="vjs-no-js">
        To view this video please enable JavaScript, and consider upgrading to a
        web browser that
        <a href="https://videojs.com/html5-video-support/" target="_blank"
        >supports HTML5 video</a
        >
    </p>
</video>
<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.0.0/video.min.js"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/5.15.0/videojs-contrib-hls.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/5.15.0/videojs-contrib-hls.js"></script>--%>
<%--<script src="https://gist.githubusercontent.com/zhangciwu/1717212f91e8853b5a9f3bf5eb90084f/raw/583efcf08b8c00f4bba42ebcb2cca1fd1875c823/video.min-modify-playtoggle.js"></script>--%>
    <table id="dataTable" class="boardList" summery="프로그램 리스트" border="1">
        <caption>프로그램 리스트</caption>
        <colgroup>
            <col with="10%">
            <col with="10%">
            <col with="10%">
            <col with="10%">
            <col with="10%">
            <col with="10%">
        </colgroup>
        <thead>
            <tr>
                <th>no</th>
                <th>이름</th>
                <th>주소</th>
                <th>성명</th>
                <th>위로 아래</th>
                <th>차단</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>

<script type="text/javascript">



    var player, vodPlayer;


  //  fn_rePlayStreamUrl("https://cdntv.tbs.seoul.kr/tbs/_definst_/tbs_tv_mobile_360.smil/playlist.m3u8","","0");
    //player.autoplay('muted');
    function fn_rePlayStreamUrl(fileUrl, fileName, idx){

        var videoUrl;
        var options;
        var videoFileType = "application/x-mpegURL";
        var resolution = "720p";
        var thumbnailUrl = "/common/images/black.png";

        if(idx == '0'){
            videoUrl = fileUrl;
            options = setMainOptions(videoUrl, videoFileType, resolution, thumbnailUrl);
            player = videojs("mainVideo", options); // videojs( video태그, options ) 이 부분 설정 완료 시 영상이 페이지에 렌더링됨.
           // player.src({type : "application/x-mpegURL",  src: videoUrl });
          // document.getElementsByClassName("vjs-big-play-button")[0].click();
            // var video = $('video');
            //videoid[0].style.setProperty("display", "none", "important");
            //  video[0].play();
        } else {
            videoUrl = gfn_parseStreamingUrl(fileUrl, fileName)+"/playlist.m3u8";
            options = setVodVideoOptions(videoUrl, videoFileType, resolution, thumbnailUrl);
            vodPlayer = videojs("vodVideo", options); // videojs( video태그, options ) 이 부분 설정 완료 시 영상이 페이지에 렌더링됨.
            vodPlayer.src({ type : "application/x-mpegURL", src: videoUrl });

        }
    }

    function setMainOptions(videoUrl, videoFileType, resolution, thumbnailUrl){

        var videoOptions =
            {
                /*  sources : [
                       {
                       src : videoUrl
                       , type : videoFileType
                       , label : resolution // 해상도 720p, 480p, 360p
                       }
                   ]  */ // 동영상의 경로. 영상 타입 설정
                /*  poster : thumbnailURL*/  //썸네일의 경로
                controls : true  // 동영상 제어를 위한 컨트롤 바 제공 여부
              //  , playsinline : true // 웹 브라우저 환경의 재생 형태
              //  , autoplay : false
              //  , muted : false //최초 재생시 무음인지
                , preload : "auto" //비디오 데이터를 즉시 다운로드 시작할 지 여부
                /* , playbackRates: [.5, .75, 1, 1.25, 1.5] */   //재생 속도
                , controlBar :
                    {
                        playToggle : true //재생, 일지정지 토글
                        , volumePanel : true
                        ,currentTimeDisplay: false
                        , subsCapsButton: false
                        , pictureInPictureToggle : false //pip모드
                        , remainingTimeDisplay : false //남은 시간 표시
                        , progressControl : true //재생 진행바
                        , qualitySelector : true //품질 선택 창
                    }
                , notSupportedMessage : "ERROR"
            };
        return videoOptions;
    }

    function setVodVideoOptions(videoUrl, videoFileType, resolution, thumbnailUrl){

        var videoOptions =
            {
                /*  sources : [
                       {
                       src : videoUrl
                       , type : videoFileType
                       , label : resolution // 해상도 720p, 480p, 360p
                       }
                   ]  */ // 동영상의 경로. 영상 타입 설정
                /*  poster : thumbnailURL*/  //썸네일의 경로
                controls : true  // 동영상 제어를 위한 컨트롤 바 제공 여부
                , playsinline : true // 웹 브라우저 환경의 재생 형태
                , muted : false //최초 재생시 무음인지
                , preload : "auto" //비디오 데이터를 즉시 다운로드 시작할 지 여부
                /* , playbackRates: [.5, .75, 1, 1.25, 1.5] */   //재생 속도
                , controlBar :
                    {
                        playToggle : true //재생, 일지정지 토글
                        , volumePanel : false
                        ,currentTimeDisplay: true
                        , subsCapsButton: false
                        , pictureInPictureToggle : false //pip모드
                        , remainingTimeDisplay : false //남은 시간 표시
                        , progressControl : true //재생 진행바
                        , qualitySelector : true //품질 선택 창
                    }
                , notSupportedMessage : "ERROR"
            };
        return videoOptions;

    }
    jQuery(function(){




        $(".pop1").hide();

        $(".tvPlay a").click(function() {
            $(".pop1").show();
            player.pause();
        });


        $(".pop1 .close").click(function() {
            $(".pop1").hide();
            vodPlayer.pause();
            player.play();
        });



    });


</script>
</body>

</html>
