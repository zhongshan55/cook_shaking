<template>
  <div class="strip">
    <div class="return" @click="return_me">
      <img src="../../../public/image/me/return.png" alt />
    </div>
    <div class="user-top">我的账号</div>
    <ul>
      <li>
        <span>头像</span>
        <img src="../../assets/me1.png" alt />
      </li>
      <li>
        <span>用户姓名</span>
        <span>{{data.user_name}}</span>
      </li>
      <li>
        <span>登录账号</span>
        <span>{{data.uname}}</span>
      </li>
      <li>
        <span>手机号码</span>
        <span>{{data.phone}}</span>
      </li>
      <li>
        <span>邮箱</span>
        <span>{{data.email}}</span>
      </li>
    </ul>
    <div class="log_out" @click="logOut">退出登录</div>
  </div>
</template>    
<script>
export default {
  data() {
    return {
        data:{}
    };
  },
  methods:{
    //返回上一页
    return_me(){
        // history.go(-1);
        this.$router.back(-1);
    },
    //退出登录
    logOut(){
        console.log("退出登录");
        var url="user/logout" ;
        this.axios.get(url).then(res=>{
          this.$toast(res.data.msg);
          this.$router.push("/login")  
        })
    },
      loadMore(){
      var url="user/person";
     this.axios.get(url).then(res=>{
    //   获取返回结果
        if(res.data.code==-1){
              this.loginState=0;  //未登录 将status为0 
        }else{
            this.loginState=1;    //已登录  将status为1
              this.data=res.data.data ;
            // console.log(this.data);
            }
            })
       }  
  },
  created(){
      this.loadMore();
  }
};
</script>
<style scoped>
html,body{height:100%;overflow:hidden;box-sizing:border-box; -moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
 body{background-color:#E8C9B5}
.strip {
  height: 100%;
  background: #f0f0f0;
  position: relative;
}

.user-top {
  height: 48px;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  line-height: 48px;
  background: #fff;
  border-bottom: 2px solid #ddd;
}
div.return {
  /* float:left; */
  width: 30px;
  height: 30px;
  position: absolute;
  top: 9px;
  left: 15px;
}
div.return > img {
  width: 100%;
}
ul {
  list-style: none;
  margin-top: 12px;
  padding: 0 15px;
  background: #fff;
}
ul > li {
  background: #fff;
  border-bottom: 1px solid #f0f0f0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  padding-left: 10px;
}
ul > li:first-child img {
  width: 35px;
  border-radius: 50%;
  padding: 10px;
  margin-right: 10px;
}
ul>li>span:last-child{
    margin-right:10px;
}
ul > li + li {
  height: 45px;
}
div.log_out {
  background: #fff;
  text-align: center;
  height: 45px;
  line-height: 45px;
  font-size: 14px;
  color: red;
  border-bottom: 1px solid #eee;
  border-top: 1px solid #eee;
}
</style>