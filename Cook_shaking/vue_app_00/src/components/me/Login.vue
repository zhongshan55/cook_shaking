<template>
    <div class="app-login">
        <div class="login-top">            
            <img src="../../../public/image/me/logo.png" alt="" class="logo-icon">
            <div class="return" @click="return_me" ><img src="../../../public/image/me/return.png" alt=""></div>
        </div>
        <div class="login-selected">
        <mt-navbar class="page-part" v-model="selected">
            <mt-tab-item id="login" >登录</mt-tab-item>
            <mt-tab-item id="reg">注册</mt-tab-item>
        </mt-navbar>
         <div class="content">
         <mt-tab-container v-model="selected">
            <mt-tab-container-item id="login">    
                <mt-field placeholder="请输入注册账号" v-model="uname"></mt-field>
                <mt-field placeholder="请输入密码" type="password" v-model="upwd"></mt-field>
                <!-- 验证码  -->
                 <!-- 后台返回的验证码svg  -->
                <div v-html="captcha" class="captcha" @click="createCap">{{captcha}}</div> 
                <!-- 设置验证码输入框宽度为50%,inline-block; -->
                <mt-field placeholder="输入验证码" v-model="cap" style="width:50%;display:inline-block"></mt-field>
                <mt-button size="large" @click="login">登录</mt-button>
            </mt-tab-container-item>
            <!-- 注册内容 -->
            <mt-tab-container-item id="reg">
                <mt-field placeholder="请输入用户名" v-model="uname2"></mt-field>
                <mt-field placeholder="请输入密码" type="password" v-model="upwd2"></mt-field>
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
export default {
    data(){
        return{
          selected:"login",
          uname:"",
          upwd:"",
          //注册页面数据
          uname2:"",
          upwd2:"",
          cupwd:"",
          user_name:"",
          phone:"",
          email:"",
          captcha:"",   //后台生成的验证码svg路径
          cap:"",   //输入验证值
          cap2:""   //返回的验证码文字
        }
    },
    methods:{
        return_me(){       
            // 返回上一页
            history.back(); 
        },
        createCap(){  //获取验证码
          var url="user/captcha";
          this.axios.get(url).then(res=>{
               this.captcha=res.data.img;   //接收返回的验证码svg
               this.cap2=res.data.captcha;  //接收验证码的文字 
            //    console.log(res.data.captcha);
          })
    
        },
        login(){
            //获取用户输入用户名
            var uname=this.uname;
            //获取用户输入密码
            var upwd=this.upwd;
            //获取输入验证码
            var cap=this.cap;
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
            //验证验证码
             if(cap.toLowerCase()!=this.cap2.toLowerCase()){
                 this.$toast({message:"验证码有误,请重新输入"});
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
                     this.$toast("登录成功")
                    this.$router.push("/")
                }
            })
        },
        reg(){
            //获取用户名输入密码
            var uname=this.uname2;
            //获取用户输入密码
            var upwd=this.upwd2;
            //获取用户确认密码
            var cupwd=this.cupwd;
            var email=this.email ,user_name=this.user_name,phone=this.phone;
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
            if(upwd!==cupwd){
                this.$toast({message:"两次输入密码不一致"});
                return;
            }
            //发送ajax请求
            var url="user/reg";
            var obj={uname:uname,upwd:upwd,email:email,phone:phone,user_name:user_name}
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code==-1){
                    this.$toast(res.data.msg)
                }else if(res.data.code==0){
                   this.$toast(res.data.msg)
                }else{
                     this.$messagebox("消息","账号注册成功!").then(res=>{})
                }                
            })

        }
    },
    created(){
        this.createCap();
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
.captcha{
    float:right;
    width: 50%;
    text-align:right;
}
.mint-button--default{ /*按钮颜色*/
margin-top:20px;
background: #784204;
color: #fff;
}
</style>
