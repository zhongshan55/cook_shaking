<template>
  <div class="product">
    <div class="goods_item" v-for="(item,i) of list" :key="i">
      <!-- 商品图片 -->
      <img :src="'http://127.0.0.1:3000/'+item.pic">
      <!-- 商品介绍上部分 -->
      <div class="goods_top">
        <!-- 左边标题和副标题 -->
        <div class="left">
          <h4>{{item.title}}</h4>
          <p class="sub_title">{{item.subtitle}}</p>
        </div>
        <!-- 右边收藏小图片 -->
        <div class="right" >
          <mt-button @click="addCollect"
          :data-fid="item.fid"
          :data-cid="item.cid"
          :data-title="item.title"
          :data-detail="item.detail"
          :data-subtitle="item.subtitle"
          :data-pic="item.pic"
          :data-href="item.href"
          >
            <img src="../../../public/image/collect/collect.png">
          </mt-button>
        </div>
      </div>
      <!-- 商品下部分详情介绍 -->
      <p class="intr">{{item.detail}}</p> 
    </div> 
    <mt-button type="primary" size="large" @click="loadMore" class="btn">加载更多...</mt-button>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],  //商品列表数据
      pno:0     //页面(第几页)
    }
  },
  methods:{
    loadMore(){
      //功能:获取商品分页数据
      // 1.发送请求
      var url="sort/sichuan";
      //当前页码1
      this.pno++;
      //创建参数对象
      var obj = {pno:this.pno};
      //发送ajax请求获取当前页内容
      this.axios.get(url,{params:obj}).then(res=>{
        // 2.获取服务器返回结果
        //console.log(res.data.data);
        // 3.将返回结果保存
        // var row = 1页.concat(2页)
        //this.list = res.data.data;
        // 4.拼接多页内容
        var rows = this.list.concat(res.data); 
        // 5.将结果赋值list
        this.list = rows;
        //console.log(this.list);
      })
    },
    addCollect(e){ //添加收藏夹
      //获取数据
      //console.log(111);
      var fid=e.target.dataset.fid;
      //console.log(fid);
      var cid=e.target.dataset.cid;
      //console.log(cid)
      var title=e.target.dataset.title;
      var subtitle=e.target.dataset.subtitle;
      var detail=e.target.dataset.detail;
      var pic=e.target.dataset.pic;
      var href=e.target.dataset.href;
      //请求地址
      var url="addcollect";
      //请求参数
      var obj={fid,cid,title,subtitle,pic,href,detail}
      //获取返回结果
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==-1){
          this.$messagebox("消息","请先登录再收藏")
            .then(res=>{
            this.$router.push("/Login");
             return;
           })
         }else{
           this.$toast("添加成功")
        }
        if(res.data.code==-2){
           this.$messagebox("你好呀！！！","已收藏过了")
         }
      })
    },
  },
  created(){
    this.loadMore();
  }
}
</script>

<style scoped>
*{
  padding:0;
  margin:0;
}
/* 顶部类名 */
ul{
  list-style: none;
  height:30px;
  display:flex;
  justify-content: space-around;
  border-bottom:1px solid #ccc;
  padding-top:20px;
  margin-bottom:20px;
}
ul li{
  font-size:16px;
  font-weight:bold;
  padding-bottom: 10px;
}
ul li a{
  text-decoration: none;
  color:#000;
  display: inline-block;
  height: 25px;
}
/* 选中类名后样式 */
.active{
  border-bottom:5px solid #ccc;
}
/* 1.最外层样式 */
.product{
  display: flex;   
  flex-wrap: wrap;
  justify-content: space-between; 
  margin:0 10px;
}
/* 2.修饰商品样式 */
.goods_item{
  width:49%; 
  box-shadow: 0px 1px 5px 0 #c0bfbe;
  border-radius: 5px; 
  text-align: left;
  margin:5px 0;  
  padding: 2px;  
  box-sizing: border-box; 
  display: flex; 
  flex-direction: column; 
  padding: 5px;
}
/* 3.修饰商品中图片样式 */
.goods_item>img{
  width: 100%;
  padding-bottom:10px;
}
/* 4.商品介绍上部分 */
.goods_top{
  display: flex;
  justify-content: space-between;
}
/* 左边标题和副标题  */
.goods_top .left{
  width: 60%;
}
.goods_top .left h4{
  font-size:20px;
  font-weight: normal;
  color:#d4ba92;
  font-style: oblique;
}
/* 副标题样式 */
.goods_top .left .sub_title{
  margin:5px 0;
  font-size: 16px;
  color:#747474;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space:nowrap;
}
/* 详情介绍 */
.goods_item .intr{
  overflow: hidden;
  text-overflow: ellipsis;
  display:-webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  font-size: 14px;
  color:#000;
  line-height: 18px;
  margin-bottom:10px;
}
/* 右边收藏按钮 */
.right>.mint-button{
  position: relative;
  border-radius: 50%;
  width:50px;
  height:50px;
}
.right img{
  position: absolute;
  top:8px;
  left:9px;
}
/* 加载更多按钮 */
.btn{
  margin-top:5px;
}
</style>