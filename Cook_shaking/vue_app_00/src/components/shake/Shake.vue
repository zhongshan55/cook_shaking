<template>
    <div id="shake" >
    <div class="shake-top">菜谱摇一摇</div>
          
        <img src="../../../public/image/shake/shake.png" alt="">
    </div>
</template>
<script>
var shake=document.getElementById("shake");
 shake.style.height = window.innerHeight + 'px'
</script>
<script>
  //先判断设备是否支持HTML5摇一摇功能
if (window.DeviceMotionEvent) {
//获取移动速度，得到device移动时相对之前某个时间的差值比
window.addEventListener('devicemotion', deviceMotionHandler, false);
}else{
alert('您好，你目前所用的设置好像不支持重力感应哦！');
}
//设置临界值,这个值可根据自己的需求进行设定，默认就3000也差不多了
var shakeThreshold = 3000;
//设置最后更新时间，用于对比
var lastUpdate = 0;
//设置位置速率
var curShakeX=curShakeY=curShakeZ=lastShakeX=lastShakeY=lastShakeZ=0;
function deviceMotionHandler(event){
//获得重力加速
var acceleration =event.accelerationIncludingGravity;
//获得当前时间戳
var curTime = new Date().getTime();
if ((curTime - lastUpdate)> 100) {
//时间差
var diffTime = curTime -lastUpdate;
lastUpdate = curTime;
//x轴加速度
curShakeX = acceleration.x;
//y轴加速度
curShakeY = acceleration.y;
//z轴加速度
curShakeZ = acceleration.z;
var speed = Math.abs(curShakeX + curShakeY + curShakeZ - lastShakeX - lastShakeY - lastShakeZ) / diffTime * 10000;
if (speed > shakeThreshold) {
    //播放音效
 shakeAudio.play();
 console.log("摇一摇成功")
}

lastShakeX = curShakeX;
lastShakeY = curShakeY;
lastShakeZ = curShakeZ;
}
}
//预加摇一摇声音
var shakeAudio = new Audio();
//摇一摇声音路径
shakeAudio.src = '../../../public/shake/lyq1762412.mp3';
var shake_options = {
preload : 'auto'
}
for(var key in shake_options){
if(shake_options.hasOwnProperty(key) && (key in shakeAudio)){
shakeAudio[key] = shake_options[key];
}
 } 
</script>
<script>
export default {
    
}
</script>
<style scope>
.shake-top{
  height: 48px;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  line-height: 48px;
  background: #fff;
  border-bottom: 2px solid #ddd;
}
.shake{
  background: #000;
}

</style>