<template>
    <div>
        <div id="top">
            <span>{{list.title}}</span>
            <div @click="return_list">
                <img src="../../../public/image/common/return.png" alt="">
            </div>
        </div>
        <div class="bpic">
            <img :src="lg_img">
        </div>
        <div class="tdiv">
            <p class="title">{{list.title}}</p>
            <div class="subtitle">
                <span>粤菜</span>
                <span>菜</span>
                <span v-if="collected==1" class="st_collect active"  @click="collect" 
                :data-fid="list.fid" 
                :data-cid="list.cid" 
                :data-title="list.title"
                :data-subtitle="list.subtitle"
                :data-detail="list.detail"
                :data-pic="list.pic"
                :data-href="list.href"
                >收藏</span>
                <span v-else class="st_collect"  @click="collect" 
                :data-fid="list.fid" 
                :data-cid="list.cid" 
                :data-title="list.title"
                :data-subtitle="list.subtitle"
                :data-detail="list.detail"
                :data-pic="list.pic"
                :data-href="list.href"
                >收藏</span>
                <p>{{list.detail}}</p>
            </div>
        </div>
        <div class="yl">
            <p style="font-size:14px;font-weight:bold">
                用料
            </p>
            <ul v-for="(item,i) of list_m" :key=i>
                <li><span>{{item.material}}</span><span>{{item.amount}}</span></li>
            </ul>
        </div>
        <div class="step">
            <div v-for="(item,i) of list_s" :key=i>
                <p>步骤{{item.step_order}}</p>
                <div class="pic">
                    <img :src="'http://127.0.0.1:3000/'+item.step_pic" >
                </div>
                <p>{{item.step_detail}} </p>
            </div>
        </div>
        <div class="commentlist">
            <p>评论</p>
            <div v-for="(item,i) of list_c" :key=i>
                <div class="touxiang">
                    <img src="../../../public/image/common/touxiang.png" alt="">
                </div>
                <div>
                    <p class="uname">
                        <span>{{item.uname}}</span>
                        <span>{{item.date}}</span>
                    </p>
                    <p class="ucom" >{{item.content}}</p>
                </div>
            </div>
        </div>
        <div class="dibu">
            <span @click="collect" 
                :data-fid="list.fid" 
                :data-cid="list.cid" 
                :data-title="list.title"
                :data-subtitle="list.subtitle"
                :data-detail="list.detail"
                :data-pic="list.pic"
                :data-href="list.href" v-if="collected==1" class="active">收藏</span>
            <span @click="collect" 
                :data-fid="list.fid" 
                :data-cid="list.cid" 
                :data-title="list.title"
                :data-subtitle="list.subtitle"
                :data-detail="list.detail"
                :data-pic="list.pic"
                :data-href="list.href"
            v-else class="shoucang">收藏</span>    
            <span @click="comment"> 32</span>
        </div>
        <div class="comment">
            <input id="txt" type="text" v-model="content"  placeholder="喜欢评论的人，做饭一定超好吃~">
            <input id="btn" type="button" value="发送" @click="send1"
            :data-cid="list.cid"
            >
        </div>
        <!-- <div id="full"></div> -->
    </div>
</template>
<script>
import $ from 'jquery'
export default {
    data() {
        return {
            list:{},
            list_m:[],
            list_s:[],
            list_c:[],
            lg_img:"",
            content:"",
            collected:0
        }
    },
    props:["cid"],
    methods:{
        fun(){
            // window.onscroll=function(){
            //     var scrollTop=document.documentElement.scrollTop;
            //     var top=document.getElementById("top");
            //     // var bpic=document.getElementsByClassName("bpic")[0];
            //     // console.log(bpic);
            //     // console.log(bpic.style.height)
            //     if(scrollTop>=430){
            //         top.className="show";
            //     }else{
            //         top.className="";
            //     }    
            // }
        }
        ,
        loadMore(){
            var url1="detail";
            console.log(this.cid);
            var obj={cid:this.cid}
            this.axios.get(url1,{params:obj}).then(res=>{
                this.list=res.data.data;
                console.log("1"+this.list)
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
            var url4="detail/comment";
            this.axios.get(url4,{params:obj}).then(res=>{
                this.list_c=res.data.data_c;
                console.log(this.list_c)
            })
            var url5="detail/collect";
            var span3=document.getElementById("span3");
            var shoucang=document.getElementById("shoucang");
            this.axios.get(url5,{params:obj}).then(res=>{
                if(res.data.code==1){
                    this.collected=1;
                    
                }else if(res.data.code==-1){
                    this.collected=-1
                    
                }
                console.log("购物车返回"+res.data.msg)
            })
        },
        return_list(){
            history.back(); 
        },
        collect(e){
            var  span3=document.getElementById("span3");
            var shoucang=document.getElementById("shoucang");
            //添加收藏夹
            //获取数据
            var fid = e.target.dataset.fid;
            
            var cid = e.target.dataset.cid;
            // console.log(cid)
            var title = e.target.dataset.title;
            // console.log("1."+title)
            var subtitle = e.target.dataset.subtitle;
            // console.log("2."+subtitle)
            var detail = e.target.dataset.detail;
            // console.log("3."+detail)
            var pic = e.target.dataset.pic;
            // console.log("4."+pic)
            var href = e.target.dataset.href;
            // console.log(href)

            //请求地址
            var url = "add/addcollect";
            //请求参数
            var obj = { fid, cid, title, subtitle, pic, href, detail };
            // 获取返回结果
            this.axios.get(url, { params: obj }).then(res => {
                if (res.data.code == -1) {
                this.$messagebox("消息", "请先登录再收藏").then(res => {
                    this.$router.push("/Login");
                    return;
                });
                } else if (res.data.code == 1) {
                    this.$toast("添加收藏成功");
                    
                
                } else if (res.data.code == 2) {
                    this.$toast("删除收藏成功");
                    
                }
                this.loadMore();
            });
        },
        comment(){
            $(".comment").show();
            this.fun1()
        },
        send1(e){
                
                var cid = e.target.dataset.cid;
                var content=this.content;
                console.log(this.content);
                var url="detail/addcomment";
                var obj={cid,content};
                var that=this;
                this.axios.get(url,{params:obj}).then(res=>{
                    if(res.data.code==-1){
                        this.$messagebox("消息","请先登录再评论").then(res=>{
                            this.$router.push("/Login");
                            return;
                        });
                    }else if(res.data.code==1){
                        this.$toast("评论成功")
                        this.loadMore();
                    }
                })
        },
        fun1(){
            $('body').click(function(e){                
                $('.comment').hide(); 
            })
            $('.dibu').click(function(e){
                e.stopPropagation();
            })
            $('.comment').click(function(e){
                e.stopPropagation();
            })
            
        }
    },
    created() {
        this.loadMore();
        this.fun()  
    
    },
    mounted() {
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
    #top>div{
        width:48px;
        height:48px;
    }
    #top img{
        width:24px;
        margin: 12px;
    }
    #top span{
        position: absolute;
        top:50%;
        left:50%;
        transform: translate(-50%,-50%);
        font-size:22px;
        opacity: 0;
        transition: all 0.5s linear;
    }
    #top.show span{
        opacity: 1;
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
    /* .subtitle>span{
        margin-right: 5px;
    } */
    
    .subtitle p{
        text-indent: 32px;
    }
    .st_collect{
        display: block;
        position: absolute;
        right:15px;
        top:0;
        background: url("../../../public/image/common/collect1.png") no-repeat center left;
        background-size:18px 18px;
        height: 18px;
        padding-left: 20px;
        color:#dbdbdb;
    }
    .st_collect.active{
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
        display: flex;
        justify-content: space-between;
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
        z-index: 2;
    }
    .dibu span{
        line-height: 48px;
        margin-left: 10px;
        margin-right: 10px;
    }
    .shoucang{
        background: url("../../../public/image/common/shoucang.png") no-repeat center left;
        background-size: 18px 18px;
        padding-left: 20px;
        color:#dbdbdb;
    }
    .active{
        background: url("../../../public/image/common/shoucang1.png") no-repeat center left;
        background-size: 18px 18px;
        padding-left: 20px;
        color:#f66;
    }
    div>span:last-child{
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
        z-index: 3;
        display: none;  
    }
    .comment input{
        border:0;
        margin-left: 20px;
        margin-right: 10px;
        outline: none;
    }
    #txt{
        width:250px;
        height:34px;
        border-radius: 4px;  
        padding-left:5px;
    }
    #btn{
        width:45px;
        background: transparent;
        color:#f00;
    }
</style>
