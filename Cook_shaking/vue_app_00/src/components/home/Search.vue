<template>
 <div>
     <div class="search">
         <span class="retreat" @click="go_retreat"> &lt; 返回</span>
         <div class="search_in">
          <img  class="img_left" src="../../assets/search.png" >
         <img class="img_right" src="../../assets/close.png" v-if="value" @click="clean">
         <input type="text"  placeholder="搜索菜谱"  v-model="value">
         </div>
         <div class="search_btn">
         <button @click="search">搜索</button>
         </div>
     </div>
           
          <ul v-if="result">
          <li class="collectList"  :data-cid="item.cid" @click="go_detail" v-for="(item,i) of list" :key="i">
    
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
                <!-- <span>取消收藏 </span><img src="../../../public/image/collect/collect_active.png" > -->
              </div>
            </div>
            <!-- 右侧下部分详情介绍 -->
            <div class="right_intr">
              <p>{{item.detail}}</p>
            </div>
          </div>     
      </li>
      </ul>
      <div v-else class="bg">
        <img src="../../assets/search_res.png" alt="">
         </div>
  
     
 </div>

</template>
<script>
export default {
    data(){
       return{
           value:"",
           result:false,
           list:[]
       }
    },
    methods:{
      go_retreat(){
        this. $router.go(-1);
      },
      clean(){
        this.value=""
      },
        search(){
            var sql="home/search"
            var obj={val:this.value};
            this.axios.get(sql,{params:obj}).then((res)=>{
                if(res.data.data.length==0){
                    this.result=false
                }else{
                    this.result=true;
                    this.list=res.data.data;
                    console.log(this.list)
                }
            })
        },
           //跳转到详情页面
    go_detail(e){
      var cid=e.currentTarget.dataset.cid;
      this.$router.push(`/detail/${cid}`) 
    }
    },
    created(){
        // console.log(this.value+"111")
    },
    watch:{
        value(){
            // this.search()
        },
        
    }
}
</script>
<style scoped>
/* 清除默认样式 */
*{
  padding:0;
  margin:0;
}

/* 搜索框样式 */
div.search{
  background: #eee;
  display: flex;
  height: 50px;
}
span.retreat{
  display: inline-block;
  height: 50px;
  line-height: 50px;
  color:#999;
  width: 15%;
  text-align: center;
}
  
div.search_in{
  width: 70%;
  background: #fff#999;
  position:relative;
}
.search_in>input{
  height: 40px;
  padding-left:25px;
  border:0;
  outline: none;
  background: #fafafa;
  border-radius: 20px;
  width: 100%;
  box-sizing: border-box;
  margin-top:5px;
  margin-left: 5px;
  margin-right: 5px;
}
.search_in>.img_left{
  position:absolute;
  left:10px;
  top:17px;

}
.search_in>.img_right{
  position: absolute;
  right:5px;
  top:17px;
  width: 16px;

}
.search .search_btn{
  width: 15%;
  line-height: 50px;
  text-align:center;
}
.search_btn>button{
  width:  80%;
  height: 40px;
  border:1px solid #ddd;
  background: #eee;
  font-size:16px;
  color:rgb(58, 57, 57);
  border-radius:5px;
  outline: none;
}
div.bg{
  text-align:center;
  
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