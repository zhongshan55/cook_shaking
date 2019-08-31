<template>
    <div>
        <div id="top">
            <img src="../../../public/image/common/return.png" alt="">
        </div>
        <div class="bpic">
            <img :src="lg_img">
        </div>
        <div class="tdiv">
            <p class="title">{{list.title}}</p>
            <div class="subtitle">
                <span>粤菜</span>&nbsp;&nbsp;
                <span>菜</span>
                <span id="span3"  @click="collect1">收藏</span>
                <p>{{list.detail}}</p>
            </div>
        </div>
        <div class="yl">
            <p style="font-size:14px;font-weight:bold">
                用料
            </p>
            <ul v-for="(item,i) of list_m" :key=i>
                <li><span>{{item.material}}</span><span>{{item.amount}}</span></li>
                <!-- <li>{{list_m.amount}}</li>
                <li>西兰花</li>
                <li>小半朵</li>
                <li>虾仁</li>
                <li>15个左右</li>
                <li>内脂豆腐</li>
                <li>半盒</li> -->
            </ul>
        </div>
        <div class="step">
            <div v-for="(item,i) of list_s" :key=i>
                <p>步骤{{item.step_order}}</p>
                <div class="pic">
                    <img :src="'http://127.0.0.1:3000/'+item.step_pic" >
                </div>
                <p>{{item.step_detail}} </p>
                <!-- <p>2.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                <p>3.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p> -->
            </div>
            <!-- <div>
                <p>步骤2</p>
                <div class="pic">
                    <img src="../../../public/image/common/step2.jpeg" alt="">
                </div>
                <p>1.Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sit </p>
                <p>2.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                <p>3.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            </div>
            <div>
                <p>步骤3</p>
                <div class="pic">
                    <img src="../../../public/image/common/step3.jpeg" alt="">
                </div>
                <p>1.Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sit </p>
                <p>2.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                <p>3.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            </div>
            <div>
                <p>步骤4</p>
                <div class="pic">
                    <img src="../../../public/image/common/step3.jpeg" alt="">
                </div>
                <p>1.Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sit </p>
                <p>2.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                <p>3.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            </div> -->
        </div>
        <div class="commentlist">
            <p>评论</p>
            <div>
                <div class="touxiang">
                    <img src="../../../public/image/common/touxiang.png" alt="">
                </div>
                <div>
                    <p class="uname">Lorem ipsum dolor sit amet.</p>
                    <p class="ucom" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa hic veniam quae </p>
                </div>
            </div>
            <div>
                <div class="touxiang">
                    <img src="../../../public/image/common/touxiang.png" alt="">
                </div>
                <div>
                    <p class="uname">Lorem ipsum </p>
                    <p class="ucom">Lorem ipsum dolor sit amet consectetur adipisicing</p>
                </div>
            </div>
        </div>
        <div class="dibu">
            <span id="shoucang" @click="collect2">收藏</span>
            <span @click="comment"> 32</span>
        </div>
        <div class="comment">
            <input id="txt" type="text" placeholder="喜欢评论的人，做饭一定超好吃~">
            <input id="btn" type="button" value="发送">
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            list:{},
            list_m:[],
            list_s:[],
            lg_img:""
        }
    },
    props:["cid"],
    methods:{
        fun(){
            window.onscroll=function(){
                var scrollTop=document.documentElement.scrollTop;
                var top=document.getElementById("top");
                // var bpic=document.getElementsByClassName("bpic")[0];
                // console.log(bpic);
                // console.log(bpic.style.height)
                if(scrollTop>=430){
                    top.className="show";
                }else{
                    top.className="";
                }    
            }
        }
        ,
        loadMore(){
            var url1="detail";
            console.log(this.cid);
            var obj={cid:this.cid}
            this.axios.get(url1,{params:obj}).then(res=>{
                this.list=res.data.data;
                console.log(this.list)
                this.lg_img='http://127.0.0.1:3000/'+this.list.pic
            })
            var url2="detail/material";
            this.axios.get(url2,{params:obj}).then(res=>{
                this.list_m=res.data.data_m;
                console.log(this.list_m)
            })
            var url3="detail/step";
            this.axios.get(url3,{params:obj}).then(res=>{
                this.list_s=res.data.data_s;
                console.log(this.list_s)
            })
        },
        collect1(){
           var  span3=document.getElementById("span3");
           var shoucang=document.getElementById("shoucang");
           if(span3.className==""){
                span3.className="active";
                shoucang.className="active";
           }else{
               span3.className="";
               shoucang.className="" ;
           }
        },
        collect2(){
            var  span3=document.getElementById("span3");
            var shoucang=document.getElementById("shoucang");
            if(shoucang.className==""){
                span3.className="active";
                shoucang.className="active";
            }else{
               span3.className="";
               shoucang.className="";
            }
        },
        comment(){

        }
    },
    created() {
        this.loadMore();
    },
    mounted() {
      this.fun()  
    },

}


</script>
<style scoped>
    #top{
        position: fixed;
        width: 100%;
        height:48px;
        z-index: 2;
        transition: all 0.5s linear;
    }
    #top.show{
        opacity: 1;
        background: #fff;
    }
    #top img{
        width:24px;
        margin: 12px;
    }
    .bpic img{
        width:100%;
    }
    .tdiv{
        border-bottom:1px solid #dedede;
        margin-left:15px;
        margin-right:15px;
        
    }
    .title{
        text-align: center;
        font-weight: bold;
        font-size: 20px;
    }
    .subtitle{
        position: relative;
    }
    .subtitle #span3{
        position: absolute;
        right:15px;
        top:0;
    }
    .subtitle p{
        text-indent: 32px;
    }
    #span3{
        display: block;
        background: url("../../../public/image/common/collect1.png") no-repeat center left;
        background-size:18px 18px;
        height: 18px;
        padding-left: 20px;
        color:#dbdbdb;
    }
    #span3.active{
        background: url("../../../public/image/common/collect.png") no-repeat center left;
        background-size:18px 18px;
        color:#efce4a;
    }
    
    .yl{
        padding-left:15px;
        padding-right:15px;
         
    }
    .yl ul{
        padding-left: 0;

    }
    .yl ul::after{
        content: "";
        display: block;
        clear: both;
    }
    .yl ul li{
        width:100%;
        display: block;
        display: flex;
        justify-content:space-around;
        border-bottom: 1px solid #dedede;
        margin-top:15px;
        padding-bottom:10px;
        font-size: 13px;
        color:#333;
    }
    .yl ul li>span{
        width: 50%;
        text-align: center;
    }
    .step>div{
        margin:15px;
        border-bottom: 1px solid #dedede;
    }
    .step>div>p:first-of-type{
        font-size: 18px;
        font-weight: bold;
        margin-top: 12px;
    }
    .step>div>p:last-of-type{
        font-size: 15px;
        margin-bottom: 25px;
    }
    .pic{
        width: 345px;
        height: 240px;
        overflow: hidden;
        margin: 0 auto;
        border-radius: 3px;
        position: relative;
    }
    .pic img{
        width: 345px;
        position: absolute;
        top:50%;
        transform: translateY(-50%);
    }
    .commentlist{
        margin:50px 15px;
    }
    .commentlist>p{
        font-size: 18px;
        font-weight: bold;
    }
    .commentlist>div{
        
        display: flex;
    }
    .commentlist .touxiang{
        margin-right: 10px;
    }
    .commentlist img{
        width: 30px;
    }
    .commentlist .uname{
        margin-top:0px;
        margin-bottom:10px;
        color:#bbb;
    }
    .commentlist .ucom{
        margin-top: 0px;
        margin-bottom: 20px;
    }
    .dibu{
        background: #fff;
        position: fixed;
        bottom: 0px;
        width: 100%;
        height: 48px;
        /* display: none; */
    }
    .dibu span{
        line-height: 48px;
        margin-left: 10px;
        margin-right: 10px;
    }
    #shoucang{
        background: url("../../../public/image/common/shoucang.png") no-repeat center left;
        background-size: 18px 18px;
        padding-left: 20px;
        color:#dbdbdb;
    }
    #shoucang.active{
        background: url("../../../public/image/common/shoucang1.png") no-repeat center left;
        background-size: 18px 18px;
        color:#f66;
    }
    #shoucang+span{
        background: url("../../../public/image/common/pinglun.png") no-repeat center left;
        background-size:18px 18px;
        padding-left: 20px;
    }
    .comment{
        position: fixed;
        bottom: 0px;
        width: 100%;
        height: 48px;
        line-height: 48px;
        background: #eee;
        display: none;
    }
    .comment input{
        border:0;
        margin-left: 20px;
        margin-right: 20px;
    }
    #txt{
        outline: none;
        width:250px;
        height:34px;
        border-radius: 4px;    
    }
    #btn{
        width:45px;
        background: transparent;
        color:#f00;
    }
</style>
