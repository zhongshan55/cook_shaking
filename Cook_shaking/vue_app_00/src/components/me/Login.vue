<template>
    <div class="app-login">
        <div class="login-top">            
            <img src="../../../public/image/logo.png" alt="" class="logo-icon">
            <div class="return" @click="return_me" ><img src="../../../public/image/return.png" alt=""></div>
        </div>
        <div class="login-selected">
        <mt-navbar class="page-part" v-model="selected">
            <mt-tab-item id="login">登录</mt-tab-item>
            <mt-tab-item id="reg">注册</mt-tab-item>
        </mt-navbar>
         <div class="content">
         <mt-tab-container v-model="selected">
            <mt-tab-container-item id="login">    
                <mt-field placeholder="请输入注册账号" v-model="uname"></mt-field>
                <mt-field placeholder="请输入密码" type="password" v-model="upwd"></mt-field>
                <mt-button size="large" @click="login">登录</mt-button>
            </mt-tab-container-item>
            <!-- 注册内容 -->
            <mt-tab-container-item id="reg">
                <mt-field placeholder="请输入用户名" v-model="uname"></mt-field>
                <mt-field placeholder="请输入密码" type="password" v-model="upwd"></mt-field>
                <mt-field placeholder="请确认密码" type="password" v-model="cupwd"></mt-field>
                <mt-field placeholder="请输入用户姓名" v-model="user_name"></mt-field>  
                <mt-field placeholder="请输入手机号码" type="tel" v-model="phone"></mt-field>   
                <mt-field placeholder="请输入邮箱" type="email" v-model="email"></mt-field>   

                <mt-button size="large" @click="reg">注册</mt-button>
            </mt-tab-container-item>
        </mt-tab-container>
         </div>
        </div>
    </div>
</template>
<script>
// import Index from '../Index.vue'
export default {
    data(){
        return{
          selected:"login",
          uname:"",
          upwd:"",
          cupwd:"",
          user_name:"",
          phone:"",
          email:""
        }
    },
    methods:{
        return_me(){       
            // 返回上一页
            history.go(-1); 
        },
        login(){
            //获取用户输入用户名
            var uname=this.uname;
            //获取用户输入密码
            var upwd=this.upwd;
            //创建正则表达式验证用户名和密码
            var reg=/^[a-z0-9]{3,12}$/i;
            //验证用户名
            if(!reg.test(uname)){
                this.$toast({message:"用户名格式不正确"});
                return;
            }
            //验证密码
            if(!reg.test(upwd)){
                this.$toast({message:"密码格式不正确"});
                return;
            }
            //发送ajax 请求 axios
            var url="user/login";
            var obj={uname:uname,upwd:upwd}
            this.axios.get(url,{params:obj}).then(res=>{
                // 获取服务器返回结果
                // 登录失败 提示
                if(res.data.code==-1){
                    this.$toast("用户和密码有误")
                }else{
                    // 登录成功 跳转首页组件
                    this.$router.push("/")
                }
            })
        },
        reg(){
            //获取用户名输入密码
            var uname=this.uname;
            //获取用户输入密码
            var upwd=this.upwd;
            //获取用户确认密码
            var cupwd=this.cupwd;
            //创建正则表达式验证用户名和密码
            var reg=/^[a-z0-9]{3,12}$/i;
            //验证用户名
            if (!reg.test(uname)){
                this.$toast({message:"用户名格式不正确"});
                return;
            }
            //验证密码
            if(!reg.test(upwd)){
                this.$toast({message:"密码格式不正确"});
                return;
            }
            //验证确认密码
            if(!reg.test(cupwd)){
                this.$toast({message:"密码格式不正确"});
                return;
            }
            //验证两次密码输入是否一致
            console.log(cupwd);
            console.log(upwd);
            if(upwd!==cupwd){
                this.$toast({message:"两次输入密码不一致"});
                return;
            }
        }
    }
}
</script>
<style scoped>
 .login-top{
     height: 48px;
      text-align: center;
      width: 100%;
      position: relative;
      border-bottom:2px solid #f0f0f0;
 }
  .login-top>img{
      width: 30px;
    margin-top:10px;
    position:absolute;
    left: 50%;
    margin-left:-15px;
  }
   .return{
      width:60px;
      position: absolute;
  }
  .return>img{
      width: 30px;
      margin-top:9px
  }
  .login-selected{
      padding:0 20px
  }
  /* 修改颜色 */
  .mint-navbar .mint-tab-item.is-selected{
      border-bottom:3px solid#442818;
  }
  /* 登录/注册内容 */
.content{
   margin-top:20px;  /*与顶部切换登录按钮的距离*/
}
.mint-cell-wrapper{
    border-bottom:1px solid #ccc;
}
.mint-button--default{ /*按钮颜色*/
margin-top:20px;
background: #784204;
color: #fff;
}
</style>
