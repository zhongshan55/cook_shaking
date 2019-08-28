<template>
    <div class="shake-cook" @click="cooke"> 
   <div class='selector'>
   <ul>
    <li>
      <label for='1'>Option 1</label>
    </li>
    <li>
      <label for='2'>Option 2</label>
    </li>
    <li>
      <label for='3'>Option 3</label>
    </li>
    <li>
      <label for='4'>Option 4</label>
    </li>
    <li>
      <label for='5'>Option 5</label>
    </li>

  </ul>
  <!-- <button ></button> -->
  </div>      
    </div>
</template>   
<script>
import $ from 'jquery'
export default {
    data(){
        return{
        angleStart :-360
        }
    },
    methods:{
        
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
    cooke(){
        this.toggleOptions('.selector')
        console.log($('.selector'))
    }
    }
}
</script>
<style scoped>

.shake-cook{
  /* width:100%;
  height: 500px;
  background: red; */
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
  width: 80px;
  height: 80px;
  margin-top: -70px;
  margin-left: -70px;
}

.selector, .selector button {
  font-family: 'Oswald', sans-serif;
  font-weight: 300;
}

.selector button {
  position: relative;
  width: 100%;
  height: 100%;
  padding: 10px;
  background: transparent;
  border-radius: 50%;
  border: 0;
  color: white;
  font-size: 20px;
  cursor: pointer;
 box-shadow: 0 3px 3px rgba(0, 0, 0, 0.1);
  transition: all .1s;
}

.selector button:focus {
  outline: none;
}

.selector ul {
  position: absolute;
  list-style: none;
  padding: 0;
  margin: 0;
  top: -20px;
  right: -20px;
  bottom: -20px;
  left: -20px;
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
  width: 110px;
  height: 110px;
  line-height: 80px;
  margin-left: -40px;
  box-shadow: 0 3px 3px rgba(0, 0, 0, 0.1);
  font-size: 14px;
}
</style>