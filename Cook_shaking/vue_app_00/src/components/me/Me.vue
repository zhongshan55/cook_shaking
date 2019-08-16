<template>
   <div>
       <div class="strip">
      <div class="me-top">
          <div class="me-user">
              <span @click="go_login" v-show="true">登录/注册</span>
              <!-- <span @click="go_user" v-show="false">{{data.user_name}}</span>      -->
          <div class="me-photo"><img src="../../assets/me1.png" alt=""></div>
          </div>
      </div>
      <ul class="balance"> 
          <li>
              <h3>15</h3>
              <span>作品</span>
          </li>
          <li>
              <h3>200</h3>
              <span>评论</span>
          </li>
      </ul>
      
    <ul class="me_module1">
        <li class="">   
            <div class="row_img"><img src="../../../public/image/dingdan.png" alt=""></div>
             <div class="row_content">
             <div class="title">浏览历史</div>
             <div class="arrow">></div>
             </div>
        </li>
                <li class="">   
            <div class="row_img"><img src="../../../public/image/address.png" alt=""></div>
             <div class="row_content">
             <div class="title">地址定位</div>
             <div class="arrow">></div>
             </div>
        </li>
                <li class="">   
            <div class="row_img"><img src="../../../public/image/discount.png" alt=""></div>
             <div class="row_content">
             <div class="title">我的关注</div>
             <div class="arrow">></div>
             </div>
        </li>
                <li class="">   
            <div class="row_img"><img src="../../../public/image/balance.png" alt=""></div>
             <div class="row_content">
             <div class="title">我的作品</div>
             <div class="arrow">></div>
             </div>
                </li>
    </ul>
        <!-- <div class="strip"></div> 分隔横条  -->
    <ul class="me_module2">
        <li>
          <div class="row_content">
             <div class="title">用户反馈</div>
             <div class="arrow">></div>
         </div>
        </li>
                <li>
          <div class="row_content">
             <div class="title">用户协议</div>
             <div class="arrow">></div>
         </div>
        </li>
                <li>
          <div class="row_content">
             <div class="title">关于</div>
             <div class="arrow">></div>
         </div>
        </li>
   </ul>
  <!-- <div class="strip"></div> 分隔横条  -->
  <ul class=me_module3>
      <li>
             <img src="../../../public/image/phone.png" alt="">
            <div >
                客户电话 888 888 8888
            </div>
      </li>
  </ul>
   </div>

   </div> <!--分隔横条  -->
</template> 
<script>

export default {
   data(){
       return{
           data:{},
           sta:0 //登录状态
       }
   },
   methods:{
       go_login(){
           this.$router.push("/Login")
       },
       go_user(){
           this.$router.push("/Login")
       },
       loadMore(){
          var url="person";
          this.axios.get(url).then(res=>{
            //   获取返回结果
            if(res.data.code==-1){
                  this.sta=0;  //未登录 将status为0 
            }else{
                this.sta=1;    //已登录  将status为1
                this.data=res.data.data ;
                console.log(this.data+"1233");
            }
          })
       }
   } ,
   created(){
       this.loadMore();
   }
}
</script>
<style scoped>

   a{
       text-decoration: none;
   }
    .strip{
      height:100%;
      background: #F0F0F0;
  }
  .me-top{
      height: 165px;
      width: 100%;
      background: url(../../../public/image/article-1.jpg) no-repeat ;
      background-size:100% 100%;
      text-align: center;
      /* line-height: 165px; */
  }
  .me-user{
      width: 85%;
      height:45px;
      background: #fff;
      margin: 0 auto;
      position: relative;
      top:80px;
      line-height: 45px;
  }
  .me-photo{
      /* padding: 3px; */
      background: #fff;
      border-radius: 50%;
      width: 65px;
      height: 65px;
      position: absolute;
      left: 10px;
      top: -20px;
  }
  .me-user>span{
      font-size: 14px;
      font-weight: 800;
      
  }
  .me-photo>img{
     border-radius: 50%;
     width: 40px;
     background: #eee;
     padding: 8px;
     vertical-align: top;
     margin: 5px;
  }
  ul{
      list-style: none;
        background: #fff;
        margin:0;
        padding:0;
      
  }
  /* 作品/[评论 */
  .balance{
      display:flex;
      justify-content: space-between;
  }
  .balance>li{
      width: 100%;
      padding: 15px;
      border-top:1px solid #ddd;
      border-bottom: 1px solid #ddd;
      text-align:center;
  }   
  .balance>li>h3{
     margin-top:0;
     margin-bottom:5px;
  }
  .balance>li:first-child{
      border-right:1px solid #eee;
  }
  .balance>li span{
      font-size: 12px;
      color:#bbb;
  }
  /* 模块1 */
  .me_module1{
      margin-top: 12px;
  }
  .me_module1>li{
    display: flex;
    align-items: center;
    height: 45px;
  }
 
  .me_module1 .row_img{    /*  模块1 小图标*/
      width: 80px;
      text-align:center;

  }
   .me_module1 .row_img>img{
       width: 25px;

   }
 .row_content{
      display: flex;
      justify-content: space-between;
      border-bottom: 2px solid #f0f0f0;
      width: 100%;

  }
  ul>li .arrow{
      width: 60px;
      height: 45px;
      line-height: 45px;
  }
  .me_module2{
      margin-top:12px
  }
  .me_module2>li{
      margin-left:20px;
  }
  ul>li .title{
    line-height: 45px;
    font-size: 14px;
  }
  .me_module3{
      margin-top:12px;
  }
  .me_module3 li div{
      height: 45px;
      text-align: center;
      line-height: 45px;
      font-size: 14px;
      border-bottom: 2px solid #f0f0f0;
  }
  .me_module3 li img{
      float:right;
      margin-right:20px;
      height: 25px;
      padding:10px;
  }

</style>
