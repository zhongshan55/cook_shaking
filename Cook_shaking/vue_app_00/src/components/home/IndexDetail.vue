<template>
<div class="main">
    <!-- logo -->
    <div class="logoandlocation">
        <div class="logo">
            <img src="../../../public/image/home/shi.png">
            <img src="../../../public/image/home/tian.png">
            <img src="../../../public/image/home/xia.png">
        </div>
        <!-- <div class="location">
            <img src="../../../public/image/location.png">
            <span><a href="javascript:;">广州</a></span>
        </div> -->
    </div>
    <div style="margin-top:50px;"></div>
    <!-- 轮播图 -->
    <carousel/>
    
    <!-- 菜系分类 -->
    <div class="navbar">
        <div class="cake">
            <a href="#"><img slot="icon" src="../../../public/image/home/gd.png" alt=""></a>
            <!-- <span>粤菜</span> -->
        </div>
        <div class="cake">
            <a href="#"><img slot="icon" src="../../../public/image/home/hn.png" alt=""></a>
            <!-- <span>湘菜</span> -->
        </div>
        <div class="cake">
            <a href="#"><img slot="icon" src="../../../public/image/home/sc.png" alt=""></a>
            <!-- <span>川菜</span> -->
        </div>
        <div class="cake">
            <a href="#"><img slot="icon" src="../../../public/image/home/zj.png" alt=""></a>
            <!-- <span>浙菜</span> -->
        </div>
    </div>
    <!-- 热门菜系介绍 -->
    <div class="goods">
        <div class="news">
            <!-- 热门 更多 -->
            <div class="title">
                <h3>热门菜列</h3>
                <a href="javascript:;" >更多<img src="../../../public/image/home/right.png" alt=""></a>
            </div>
            <!-- 菜系展示 -->
            <ul>
                <li v-for="(item,i) of list" :key="i">
                    <div class="newsImg" >
                        <a href="javascript:;">
                            <img :src="`http://127.0.0.1:3000/`+item.pic" alt="">
                        </a>
                    </div>
                    <div class="detail">
                        <div class="detailbtn">
                            <mt-button 
                            @click="addCollect"
                            :data-fid="item.fid"
                            :data-cid="item.cid"
                            :data-title="item.title"
                            :data-detail="item.detail"
                            :data-subtitle="item.subtitle"
                            :data-pic="item.pic"
                            :data-href="item.href"
                            >
                             <!-- 未收藏图标 -->
                            <img v-if="active=1" class="btnimg" :src="`http://127.0.0.1:3000/`+item.pic_collect_active">
                            <!-- 已收藏图标 -->
                            <img v-else class="btnimg" :src="`http://127.0.0.1:3000/`+item.pic_collect">
                            </mt-button>
                        </div>
                        <div class="detailtext">
                            <a href="javascript:;">
                                <span class="ptitle">{{item.title}}</span>
                                <!-- <span class="pprice"></span> -->
                                <p class="psubtitle">{{item.subtitle}}</p>
                            </a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</template>
<script>
import carousel from "./Carousel"
export default {
    data() {
        return {
            // p1:{},
            // p2:{},
            // p3:{}
            list:[],//用于接收服务器端数据
            active:0
        }
    },
    methods: {
        addCollect(e){              //添加收藏夹
            //获取数据
            var fid=e.target.dataset.fid;
            var cid=e.target.dataset.cid;
            // console.log(cid)
            var title=e.target.dataset.title;
            var subtitle=e.target.dataset.subtitle;
            var detail=e.target.dataset.detail;
            var pic=e.target.dataset.pic;
            var href=e.target.dataset.href;
            
            //请求地址
            var url="add/addcollect";
            //请求参数
            var obj={fid,cid,title,subtitle,pic,href,detail}
            // 获取返回结果
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code==-1){
                    this.$messagebox("消息","请先登录再收藏")
                    .then(res=>{
                        this.$router.push("/Login");
                        return;
                    })
                }else if(res.data.code==1) {
                    this.$toast("添加成功")
                }else if(res.data.code==2) {
                    this.$toast("删除成功")
                }


            })
        },
        load(){                     //首页信息加载
            var url="home"
            this.axios.get(url).then(result=>{
                // console.log(result.data);
                // var [p1,p2,p3]=result.data;
                // this.p1=p1;
                // this.p2=p2;
                // this.p3=p3;
                this.list=result.data.data;  //将数据传给list
                // console.log(this.list)
            }) 
        },
        // 验证是否已收藏 收藏图标变红
        addCollect_active(){
            var url="add/add_active"
            this.axios.get(url).then(res=>{
                if(res.data.code==-1){
                    // this.active=-1
                    console.log(res)
                }else{
                    // this.list_active=res.data.data
                    this.active=res.data.data[0].display
                    console.log("active"+this.active)
                }
            })
        }
    },
    components:{
        carousel
        },
    created() {
        this.load(); //首页信息加载
        this.addCollect_active()
    },
}
</script>
<style scoped>
*{
    margin: 0;
    padding: 0;
}
.main{
    overflow: hidden;
}
/*logo图片*/
.logoandlocation{
    position: fixed;
    width: 100%;
    height: 60px;
    background: white;
    border-top: 1px solid blanchedalmond;
    z-index: 999;
    padding: 5px 0;
}

.logoandlocation>.logo{
    display: flex;
    justify-content: space-around;
}
.logoandlocation>.logo>img{
    width: 50px;height:50px;
    display: block;
}

/* 地理位置 */
.logoandlocation>.location{
    display: flex;
    position: relative;
    justify-content: center;
    align-items: center;
    left: 330px;
    height: 50px;
}
.logoandlocation>.location>span{
    display: block;
    font-size: 14px;
}
.logoandlocation>.location>img{
    width: 20px;height:20px;
}
/*轮播图*/
.carousel{
    height: 222px;
    /* background: pink; */
}
.navbar{
    margin-top: 5px;
    display: flex;
    justify-content: space-around;
}
/* 字体大小 */
.navbar>div>span{
    display: block;
    font-size: 10px;
    color: #d4ba92;
}
/*  goods */
.goods{
    margin: 0 10px;
    margin-top: 10px;
    /* border-top: 1px solid #d4ba92; */
}
.goods>.news{
    border-top: 1px solid #d4ba92;
    margin-top: 20px;
}
/* 新品 更多 */
.news{
    margin-top: 10px;
}
.news>.title{
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}
/* 新品 */
.news>.title>h3{
    font-size: 16px;
    color: black;
    background: #F4EBE2;
    border-radius: 100px;
    font-weight: normal;
    padding: 3px 10px;
}
/* 更多 */
.news>.title>a{
    text-decoration: none;
    font-size: 14px;
    color: black;
    font-weight: normal;
}
/* ul 去除圆点 */
.news>ul{
    list-style: none;
}
/* a标签去除底线*/
a{
    text-decoration: none;
    color: black;
}
.newsImg{
    overflow: hidden;
}
.newsImg>a>img{
    width:100%;
}
.news>ul>li{
    box-shadow: 0px 1px 5px 0 #d4ba92;
    margin-bottom: 20px;
    border-radius: 5px;
    overflow: hidden;
}
.news>ul>li:first-child{
    margin-top: 10px;
}
.detailtext{
    width: 250px;
    text-align: left;
    margin-left: 15px;
    margin-top: 8px;
    margin-bottom: 10px;
}
.detailtext>a>.ptitle{
    font-size: 18px;
    color: #d4ba92;
    font-style: oblique;
    margin-right: 5px;
}

.detailtext>a>.psubtitle{
    /*文字超出显示...*/
    overflow : hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient: vertical;
    
    width:250px;
    margin-top: 6px;
    margin-bottom: 5px;
    font-size: 14px;
}
.detail{
    position: relative;
}
.detailbtn{
    position: absolute;
    /* width: 32px;
    height: 32px; */
    border-radius: 50px;
    outline: 0;
    top: 50%;
    margin-top: -25px;
    left: 288px;
    /* border-radius: 50%; */
}
.detailbtn>.mint-button{
    position: relative;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    /* background-image: url("../../../public/image/home/collect.png"); */
    /* background-repeat:no-repeat; */
    /* background-position:center; */
}
.btnimg{
    position: absolute;
    display: block;
    left:9px;
    top: 8px;
}
</style>

        
