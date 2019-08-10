<!-- 收藏列表 -->
<template>
  <div id="collect">
    <!-- 标题 -->
    <h3>收藏列表(4)</h3>
    <hr>
    <!-- 商品列表 -->
    <div class="collectList"> 
      <!-- 左侧图片 -->
      <div class="left">
        <img src="../../../public/image/collect/product1.jpg">
      </div>
      <!-- 右侧文字介绍 -->
      <div class="right">
        <!-- 右侧上部分标题和取消收藏 -->
        <div class="rightTop">
          <!-- 左侧标题部分 -->
          <div class="left_title">
            <p class="title">面包</p>
            <p class="sub_title">粤菜 / 面食</p>
          </div>
          <!-- 右侧取消收藏部分 -->
          <div class="right_img">
            <span>取消收藏</span><img src="../../../public/image/collect/product1.jpg">
          </div>
        </div>
        <!-- 右侧下部分详情介绍 -->
        <div class="intr">
          <p>详情介绍</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {}
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
}
/* 商品样式 */
.collectList{
  display: flex;
  justify-content: start;
  padding:10px 0;
  border-bottom:1px solid #ccc;
}
/* 左侧图片 */
.left{
  width:40%;
}
.left img{
  width:100%;
}
/* 右侧文字介绍 */
.right{
  text-align: left;
  padding: 10px;
}
/* 右侧上部分 标题 和 取消收藏  */
.right .rightTop{
  display: flex;
  justify-content: space-around;
}
/* 右侧上部分 标题  */
.right .rightTop .left_title{
  width:70%;
}
/* 右侧上部分 取消收藏 */
.right .rightTop .right_img{
  text-align: right;
}
.right .rightTop .right_img img{
  width:10%;
  vertical-align: middle;
} 
</style>


