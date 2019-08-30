<template>
    <div id="shake-content" >
    <div class="shake-top">菜谱摇一摇</div>
        <div class="shake-img"  @click="shake_in"> 
        <img src="../../../public/image/shake/shake.png" alt="">
        </div>
       <!-- 旋转动态菜单效果  -->
  <div class="shake-cook" v-if="cook==1" >
<div class='selector' >
  <ul>
    <li v-for="(item,i) of list" :key="i">
      <label ><img :src="'http://127.0.0.1:3000/'+item.pic"  :data-cid="item.cid" @click="go_detail"></label>
    </li>
  </ul>
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
        list:[],
        angleStart:-360
      }
    },

    methods:{
      go_detail(e){
        var cid=e.target.dataset.cid;
        
        this.$router.push(`/detail?cid=${cid}`);
      
      },
      loadMore(){
        //获取当前浏览器内高度
       var shake=document.getElementById("shake-content");
         shake.style.height = (window.innerHeight-55) + 'px'
      },
    //旋转动画
    rotate(li,d) {
    $({d:this.angleStart}).animate({d:d}, {
        step: function(now) {
            $(li)
               .css({ transform: 'rotate('+now+'deg)' })
               .find('label')
                  .css({ transform: 'rotate('+(-now)+'deg)' });
        }, duration: 0
    });
   },
   //显示/隐藏多选菜单
  toggleOptions(s) {
    $(s).toggleClass('open');
    var li = $(s).find('li');
    var deg = $(s).hasClass('half') ? 180/(li.length-1) : 360/li.length;
    for(var i=0; i<li.length; i++) {
        var d = $(s).hasClass('half') ? (i*deg)-90 : i*deg;
        $(s).hasClass('open') ? this.rotate(li[i],d) : this.rotate(li[i],this.angleStart);
      }
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
        // this.cook=1;
        var url="/user/shake";
        this.axios.get(url).then(res=>{
          if(res.data.code==1){
            this.list=res.data.data
            // console.log(this.list)
          }else{
            this.$toast("推荐菜谱失败")
          }
        })
        //图片晃动,通过引入animate.css实现动画效果
         $(".shake-img").addClass("animated wobble")
          
          // 动态显示菜谱,需添加定时器后加载动画函数才能出动态效果.
             var that=this
        setTimeout(function(){  
          that.cook=1;
         setTimeout(function(){
           that.toggleOptions('.selector')
            },100)
        },1000)
     }, 
     close(){  //关闭推荐按钮将cook=0;
     //去掉动画效果的类名
      $(".shake-img").removeClass("animated wobble")
     this.toggleOptions('.selector')
     var that=this;
     setTimeout(function(){
       that.cook=0},600)   
     }

    },

    mounted() {
      this.loadMore();
    }
}
</script>
<style scoped>
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
  /* transform: translate(-50%,-50%); */
  margin-left:-125px;
  margin-top:-96px;

}

.shake-cook>.close{
  width:45px;
  height:45px;
  line-height: 45px;
  border-radius: 50%;
  background: rgba(13, 188, 241, 0.1);
  border:0;
  box-shadow: none;
  color:#fff;
  font-size: 20px;
  right:-20px;
  top:-80px;
    position:absolute;
}


/*动态菜单*/
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
  
}
    .selector {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 100px;
  height: 100px;
  transform:translate(-50%,-50%)
}

.selector ul {
  position: absolute;
  list-style: none;
  padding: 0;
  margin: 0;
  top: 50%;
  /* right: 50%; */
  /* bottom: -20px; */
  left: 50%;
  width: 90px;
  height:90px;
  transform: translate(-50%,-50%)
}

.selector li {
  position: absolute;
  width: 0;
  height: 100%;
  margin: 0 50%;
  -webkit-transform: rotate(-360deg);
  transition: all 0.8s ease-in-out;
}

.selector li label {
  position: absolute;
  left: 50%;
  bottom: 100%;
  width: 0;
  height: 0;
  line-height: 1px;
  margin-left: 0;
  background: #fff;
  border-radius: 50%;
  text-align: center;
  font-size: 1px;
  overflow: hidden;
  cursor: pointer;
  box-shadow: none;
  transition: all 0.8s ease-in-out, color 0.1s, background 0.1s;
}


.selector.open li  label {
  width: 130px;
  height: 130px;
  /* line-height: 130px; */
  margin-left: -20px;
  box-shadow: 0 3px 3px rgba(212, 25, 25, 0.1);
  border:2px solid #ddd;
  font-size: 14px;
  text-align: center;
}
.selector.open li  label img{
  height: 100%;
  /* width:100%; */
  vertical-align: middle;
  position:absolute;
  left: 50%;
  transform: translateX(-50%);
}

</style>