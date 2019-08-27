<template>
    <div id="shake-content" >
    <div class="shake-top" >菜谱摇一摇</div>
        <div class="shake-img" @click="shake_in"> 
        <img src="../../../public/image/shake/shake.png" alt="">
        </div>
        <div class="shake-cook" v-if="cook==1" >
     
          <div class="cook1">
            <img :src="'http://127.0.0.1:3000/'+list[0].pic" alt="" >
          </div>
          <div class="cook2">
            <img :src="'http://127.0.0.1:3000/'+list[1].pic" alt="" data-id="list[1].cid" >
          </div>
          <div class="cook3">
            <img :src="'http://127.0.0.1:3000/'+list[2].pic" alt="">
            </div>
          <div class="cook4">
            <img :src="'http://127.0.0.1:3000/'+list[3].pic" alt="">
            </div>
          <div class="cook5">
            <img :src="'http://127.0.0.1:3000/'+list[4].pic" alt="">
            </div>
          <div class="close" @click="close">X</div>
        </div>
    </div>
</template>

<script>
import $ from 'jquery'
export default {
    data(){
      return{
        cook:0,
        // list:["0","0","0","0","0"]
        list:[""]
      }
    },
    methods:{
      loadMore(){
        //获取当前浏览器内高度
       var shake=document.getElementById("shake-content");
         shake.style.height = (window.innerHeight-55) + 'px'

         //为了防止第一次搜索时报GET http://127.0.0.1:3000/undefined 404 (Not Found)的错,进入页面默认查询一次,但不显示
         var url="/user/shake";
         this.axios.get(url).then(res=>{
          if(res.data.code==1){
            this.list=res.data.data
            console.log(this.list)
          }
         })
         
      },

      
shake_More(){
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
}
     ,
     shake_in(){   //点击摇一摇图片,显示推荐菜谱, 将cook=1;
        this.cook=1;
        var url="/user/shake";
        this.axios.get(url).then(res=>{
          if(res.data.code==1){
            this.list=res.data.data
            console.log(this.list)

          }else{
            this.$toast("推荐菜谱失败")
          }
        })
     }, 
     close(){  //关闭推荐按钮将cook=0;
      this.cook=0;
     }
    },

    mounted() {
      this.loadMore();
    }
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
#shake-content{
  background: rgb(45,45,45);
     position:relative;
}
.shake-img{
  position:absolute;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
}
.shake-cook{
  width: 300px;
  height:300px;
  border-radius:50%;
  background: url(../../../public/image/shake/bg.png);
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%,-50%);
  z-index: 100;
  text-align:center;
  line-height: 300px;
  box-shadow:1px 1px 30px #fff; 
  font-size: 18px;
  color:rgb(40, 174, 236);
  font-weight: bolder;

}
.shake-cook>div{
  width: 140px;
  height:140px;
  border-radius:50%;
  background: yellow;
  position:absolute;
  overflow: hidden;
  box-shadow: 0px 1px 20px #ddd;
  line-height: 140px;
  background: rgb(0,0,0,.8);
  text-align:center;
}
div.cook1{
  /* background: rgb(0,0,0,.8); */
  top: -53px;
  left:81px;
}
div.cook2{
  /* background: rgb(0,0,0,.8); */
  top: 39px;
  left:-38px;
}
div.cook3{
  /* background: rgb(0,0,0,.8); */
  top: 186px;
  left:-2px;
}
div.cook4{
  /* background: rgb(0,0,0,.8); */
  top: 186px;
  left:155px;
}
div.cook5{
  /* background: rgb(0,0,0,.8); */
  top: 39px;
  left:198px;
}
.shake-cook>div>img{
  /* width: 100%; */
  height: 100%;
  vertical-align: middle;  
  position:absolute;
  top:0;
  left:0;
  transform: translateX(-10%)

}
.shake-cook>.close{
  background: transparent;
  border:0;
  box-shadow: none;
  color:#fff;
  font-size: 20px;
  line-height: normal;
  left:250px;
  top:-80px;
}


</style>