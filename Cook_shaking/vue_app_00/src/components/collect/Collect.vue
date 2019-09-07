<!-- 收藏列表 -->
<template>
  <div id="collect">
    <!-- 标题 -->
    <h3>收藏列表({{list.length}})</h3>
    <hr>
    <!-- 商品列表 -->
    <div>
    <mt-loadmore :top-method="loadTop" ref='loadmore' >
    <ul>
      <li class="collectList" v-for="(item,i) of list" :key="i" :data-cid="item.cid" @click="go_detail">
    
          <!-- 左侧图片 -->
          <div class="left">
            <img :src="'http://127.0.0.1:3000/'+item.pic">
          </div>
          <!-- 右侧文字介绍 -->
          <div class="right">
            <!-- 右侧上部分标题和取消收藏 -->
            <div class="rightTop">
              <!-- 左侧标题部分 -->
              <div class="left_title">
                <p class="title">{{item.title}}</p>
                <p class="sub_title">{{item.subtitle}}</p>
              </div>
              <!-- 右侧取消收藏部分 -->
              <div class="right_img"  >
                <span>取消收藏 </span><img src="../../../public/image/collect/collect_active.png" @click="removeCollect" 
                  :data-cid="item.cid">
              </div>
            </div>
            <!-- 右侧下部分详情介绍 -->
            <div class="right_intr">
              <p>{{item.detail}}</p>
            </div>
          </div>
        
      </li>
    </ul>
    </mt-loadmore>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      list:[],
      isAutoFill:false,
      allLoaded:false
    }
  },
   loadBottom() {
      this.loadMore();
    },
  methods:{
    loadTop(){
      this.loadMore();
      // console.log("刷新")
      this.$refs.loadmore //==><ANY ref="loadmore"></ANY>
      .onTopLoaded();
    } ,
    removeCollect(e){
      e.stopPropagation();
      //请求地址
      var url = "add/removecollect";
      var cid=e.target.dataset.cid
      //请求参数
      var obj = { cid};
      // 获取返回结果
      this.axios.get(url, { params: obj }).then(res => {
        if (res.data.code == 2) {
         this.$toast("取消收藏成功");
         this.loadMore();
       } else  {
          this.$toast("取消收藏失败成功");
        }
       
      });
    },
    loadMore(){
      //功能:获取商品分页数据
      // 1.发送请求
      var url="collect";
      //发送ajax请求获取当前页内容
      this.axios.get(url).then(res=>{
        // 2.获取服务器返回结果
        //console.log(res.data);
        // 3.将返回结果保存
        // var row = 1页.concat(2页)
        this.list = res.data;
        // console.log(this.list)
        // 4.拼接多页内容
        //var rows = this.list.concat(res.data); 
        // 5.将结果赋值list
        //this.list = rows;
        //console.log(this.list);
      })
    },
    go_detail(e){
      var cid=e.currentTarget.dataset.cid;
      console.log(cid);
      this.$router.push(`/detail/${cid}`)
    }
  },
  created(){
    this.loadMore();
  }
}
</script>

<style scoped>
/* 清除默认样式 */
*{
  padding:0;
  margin:0;
}
/* 列表标题 */
h3{
  margin:10px 0;
  text-align: center;
}
/* 商品样式 */
.collectList{
  display: flex;
  justify-content: start;
  padding:10px 0;
  border-bottom:1px solid #ccc;
  /* box-sizing: border-box; */
}
/* 左侧图片 */
.left{
  width:30%;
  background: #000;
  height: 116.8px;
  line-height: 116.8px;
  overflow: hidden;
  box-sizing: border-box;
}
.left img{
  width:100%;
  vertical-align: middle;
}
/* 右侧文字介绍 */
.right{
  width:70%;
  text-align: left;
  padding: 10px;
    box-sizing: border-box;
}
/* 右侧上部分 标题 和 取消收藏  */
.right .rightTop{
  display: flex;
  justify-content: space-around;
  margin-bottom:10px;
}
/* 右侧上部分 标题  */
.right .rightTop .left_title{
  width:60%;
}
.right .rightTop .left_title .title{
  font-size:20px;
  font-weight:bold;
  margin-bottom:10px;
    overflow: hidden;
  text-overflow: ellipsis;
  white-space:nowrap;
}
/* 副标题 */
.right .rightTop .left_title .sub_title{
  font-size:16px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space:nowrap;
}
/* 右侧上部分 取消收藏 */
.right .rightTop .right_img{
  width:40%;
  text-align: right;
}
.right .rightTop .right_img span{
  font-size:13px;
}
.right .rightTop .right_img img{
  width:20%;
  vertical-align: middle;
} 
/* 右侧下部分 详情介绍 */
.right .right_intr p{
  font-size:14px;
  color:#999;
  overflow: hidden;
  text-overflow: ellipsis;
  display:-webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  line-height: 18px;
}
</style>


