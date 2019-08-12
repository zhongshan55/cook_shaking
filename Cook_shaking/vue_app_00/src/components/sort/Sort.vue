<template>
  <div>
    <!-- 顶部类名 -->
    <ul>
      <li><a href="javascript:;" class="active">川菜</a></li>
      <li><a href="javascript:;">粤菜</a></li>
      <li><a href="javascript:;">湘菜</a></li>
      <li><a href="javascript:;">鲁菜</a></li>
      <li><a href="javascript:;">苏菜</a></li>
      <li><a href="javascript:;">闽菜</a></li>
      <li><a href="javascript:;">浙菜</a></li>  
      <li><a href="javascript:;">徽菜</a></li>  
    </ul>
    <!-- 一个商品 循环  -->
    <div class="product">
      <div class="goods_item">
        <img src="../../../public/image/sort/01.jpg">
        <h4>红烧牛肉</h4>
        <p class="sub_title">红烧牛肉</p>
        <p class="intr">红烧牛肉红烧牛肉</p>
      </div>

      <div class="goods_item">
        <img src="../../../public/image/sort/01.jpg">
        <h4>红烧牛肉</h4>
        <p class="sub_title">红烧牛肉</p>
        <p class="intr">红烧牛肉红烧牛</p>
      </div>

      <div class="goods_item">
        <img src="../../../public/image/sort/03.png">
        <h4>红烧牛肉</h4>
        <p class="sub_title">红烧牛肉</p>
        <p class="intr">红烧牛肉红烧牛</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return{}
  }
}
</script>

<style scoped>
/* 清除样式 */
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
  margin:0 5px;
}
/* 2.修饰商品样式 */
.goods_item{
  width:49%; 
  box-shadow: 0px 1px 5px 0 #c0bfbe;
  border-radius: 5px; 
  text-align: left;
  margin:2px 0;  
  padding: 2px;  
  box-sizing: border-box; 
  display: flex; 
  flex-direction: column; 
  padding: 5px;
}
/* 3.修饰商品中图片样式 */
.goods_item img{
  width: 100%;
  padding-bottom:10px;
}
/* 4.修饰标题样式 */
.goods_item h4{
  font-size:16px;
  font-weight: bold;
}
.goods_item .sub_title{
  font-size: 12px;
  color:#747474;
}
.goods_item .intr{
  font-size: 12px;
  color:#000;
}
</style>