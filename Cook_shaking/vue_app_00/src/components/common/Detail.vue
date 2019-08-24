<template>
    <div>
        <div id="top">
            <img src="../../../public/image/common/return.png" alt="">
        </div>
        <div class="bpic">
            <img src="../../../public/image/common/xcf_recipe_1565694834275.jpeg" alt="">
        </div>
        <div class="tdiv">
            <p class="title">虾仁西兰花豆腐蒸蛋</p>
            <div class="subtitle">
                <span>粤菜</span>&nbsp;&nbsp;
                <span>菜</span>
                <span id="span3"  @click="collect1">收藏</span>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat nobis fugit eius, tempore vel assumenda dolore sit facilis ipsum dolorum eos incidunt repellat rerum illo repellendus reiciendis cumque enim. Eligendi?</p>
            </div>
        </div>
        <div class="yl">
            <p style="font-size:14px;font-weight:bold">
                用料
            </p>
            <ul>
                <li>鸡蛋</li>
                <li>2-3个</li>
                <li>西兰花</li>
                <li>小半朵</li>
                <li>虾仁</li>
                <li>15个左右</li>
                <li>内脂豆腐</li>
                <li>半盒</li>
            </ul>
        </div>
        <div class="step">
            <div>
                <p>步骤1</p>
                <div class="pic">
                    <img src="../../../public/image/common/step1.jpeg" alt="">
                </div>
                <p>1.Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sit </p>
                <p>2.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                <p>3.Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            </div>
            <div>
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
            </div>
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
        }
    },
    methods:{
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
    }

}

window.onscroll=function(){
    var scrollTop=document.documentElement.scrollTop;
    var top=document.getElementById("top");
    console.log(top.className);
    if(scrollTop>=430){
        top.className="show";
    }else{
        top.className="";
    }    
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
        width:50%;
        display: block;
        float: left;
        border-bottom: 1px solid #dedede;
        margin-top:15px;
        padding-bottom:10px;
        font-size: 13px;
        color:#333;
    }
    .step>div{
        margin:15px;
        border-bottom: 1px solid #dedede;
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
        color:#ccc;
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
