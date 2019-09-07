<template>
 <div>
     <div class="search">
        <mt-search v-model="value" cancel-text="取消"
  placeholder="搜索菜谱">
             <mt-cell
          v-for="(item,i) of list" :key="i" >
          <li class="collectList" :data-cid="item.cid" @click="go_detail">
    
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
             </mt-cell>
        </mt-search> 
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
            this.search()
        }
    }
}
</script>
<style scoped>
/* 清除默认样式 */
*{
  padding:0;
  margin:0;
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