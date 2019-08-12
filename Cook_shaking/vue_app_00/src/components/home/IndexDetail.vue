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
                <a href="#">更多<img src="../../../public/image/home/right.png" alt=""></a>
            </div>
            <!-- 菜系展示 -->
            <ul>
                <li>
                    <div class="newsImg" >
                        <a href="javascript:;">
                            <img src="../../../public/image/home/shaoji.jpg" alt="">
                        </a>
                    </div>
                    <div class="detail">
                        <div class="detailbtn">
                            <a href="javascript:;">
                                <img src="../../../public/image/home/collect.png" alt="">
                            </a>
                        </div>
                        <div class="detailtext">
                            <a href="javascript:;">
                                <span class="pname">米道</span>
                                <span class="pprice">298.00</span>
                                <span class="pspec">元/454g(1.0榜)</span>
                                <p class="pdetail">天真，天然，是做这款蛋糕唯一的出发点</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="newsImg" >
                        <a href="javascript:;">
                            <img src="../../../public/image/home/suancaiyu.jpg" alt="">
                        </a>
                    </div>
                    <div class="detail">
                        <div class="detailbtn">
                            <a href="javascript:;">
                                <img src="../../../public/image/home/collect.png" alt="">
                            </a>
                        </div>
                        <div class="detailtext">
                            <a href="javascript:;">
                                <span class="pname">(新)杰瑞</span>
                                <span class="pprice">198.00</span>
                                <span class="pspec">元/454g(1.0榜)</span>
                                <p class="pdetail">谁动了我的奶酪！......</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="newsImg" >
                        <a href="javascript:;">
                            <img src="../../../public/image/home/pig.jpg" alt="">
                        </a>
                    </div>
                    <div class="detail">
                        <div class="detailbtn">
                            <a href="javascript:;">
                                <img src="../../../public/image/home/collect.png" alt="">
                            </a>
                        </div>
                        <div class="detailtext">
                            <a href="javascript:;">
                                <span class="pname">浅草</span>
                                <span class="pprice">398.00</span>
                                <span class="pspec">元/454g(1.0榜)</span>
                                <p class="pdetail">浅草才能没马蹄</p>
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
            
        }
    },
    components:{carousel},
    created() {
        this.axios.get("http://127.0.0.1:8080/")
        
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
/* 服务说明 */
.ulser{
    display: flex;
    justify-content: space-around;
    padding: 0;
    margin: 10px 0;
    list-style: square;
}
/* 字体大小 */
.ulser>li{
    font-size: 12px;
    color: #d4ba92;
}
/* 蛋糕 面包 下午茶 企业中心  */
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
    width: 100%;
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
    text-align: left;
    margin-left: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
}
.detailtext>a>.pname{
    color: #322418;
    margin-right: 5px;
}
.detailtext>a>.pprice{
    color: #d4ba92;
}
.detailtext>a>.pspec{
    color: #d4ba92;
    margin-left: 5px;
    font-size: 12px;
}
.detailtext>a>.pdetail{
    margin-top: 5px;
    margin-bottom: 5px;
    font-size: 14px;
}
.detailbtn{
    width: 32px;
    height: 32px;
    background: white;
    /* border: 1px solid #d4ba92; */
    border-radius: 50px;
    padding: 6px;
    float: right;
    /* margin-top: 5px; */
    margin-right: 20px;
    outline: 0;
}
</style>

