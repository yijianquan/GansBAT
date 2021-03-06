<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>地图定位</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <style>
        html,body,#container{
            height:100%;
            width:100%;
        }
        .btn{
            width:10rem;
            margin-left:6.8rem;   
        }
    </style>
</head>
<body>
<div id="container"></div>
<div class="input-card" style='width:28rem;'>
    <form action="${ctx }/upload/mapupload" method="post">
        <label style='color:grey'>在地图上单击鼠标左键选取标记点</label>
        <div class="input-item">
            <div class="input-item-prepend"><span class="input-item-text">经纬度:</span></div>
            <input name="lnglat" id='lnglat' type="text">
        </div>
        <div class="input-item">
            <div class="input-item-prepend"><span class="input-item-text" >地址:</span></div>
            <input name="address" id='address' type="text">
        </div>
        <input type="submit" class="btn" value="提交" >
    </form>
</div>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.11&key=934a3bc6d655f359083ee2dba7789ea4&plugin=AMap.Geocoder"></script>
<script type="text/javascript">
    var map = new AMap.Map("container", {
        resizeEnable: true,
        zoom:13
    });
    
    var geocoder,marker;
    function regeoCode() {
        if(!geocoder){
            geocoder = new AMap.Geocoder({
                city: "010", //城市设为北京，默认：“全国”
                radius: 1000 //范围，默认：500
            });
        }
        var lnglat  = document.getElementById('lnglat').value.split(',');
         if(!marker){
            marker = new AMap.Marker();
            map.add(marker);
        }
        marker.setPosition(lnglat);
        
        geocoder.getAddress(lnglat, function(status, result) {
            if (status === 'complete'&&result.regeocode) {
                var address = result.regeocode.formattedAddress;
                document.getElementById('address').value = address;
            }else{alert(JSON.stringify(result))}
        });
    }
    
    map.on('click',function(e){
        document.getElementById('lnglat').value = e.lnglat;
        regeoCode();
    })
    document.getElementById("regeo").onclick = regeoCode;
    document.getElementById('lnglat').onkeydown = function(e) {
        if (e.keyCode === 13) {
            regeoCode();
            return false;
        }
        return true;
    };
</script>
</body>
</html>
