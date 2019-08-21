<template>
  <div class="page-tabbar">
    <div class="page-wrap">
        <mt-tab-container class="page-tabbar-container" v-model="active">
          <mt-tab-container-item id="home">
            <!-- 轮播图 -->
              <carousel/>
              <!-- 首页信息 -->
             <indexdetail  @uptoYue="changeTabbar($event)"/>
          </mt-tab-container-item>
          <mt-tab-container-item id="sort">
              <sort></sort>
          </mt-tab-container-item>
          <mt-tab-container-item id="shopping_cart">
                  <shake/>
          </mt-tab-container-item>
          <mt-tab-container-item id="bbs">
             <collect></collect> 
          </mt-tab-container-item>
          <mt-tab-container-item id="me">
           <!-- 我的 -->
              <me></me>
          </mt-tab-container-item>          
        </mt-tab-container>

       <!-- 底部导航条  -->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="home" @click.native="changeState(0)">
          <tabbaricon
          :focused="currentIndex[0].isSelect"
          :selectedImage="require('../assets/home1.png')"
          :normalImage="require('../assets/home2.png')"
          >
          </tabbaricon>
        首页
        </mt-tab-item>
        <mt-tab-item id="sort" @click.native="changeState(1)">
           <tabbaricon
          :focused="currentIndex[1].isSelect"
          :selectedImage="require('../assets/sort1.png')"
          :normalImage="require('../assets/sort2.png')"
          >
          </tabbaricon>
        分类
        </mt-tab-item>
        <mt-tab-item id="shopping_cart" @click.native="changeState(2)">
         <tabbaricon
          :focused="currentIndex[2].isSelect"
          :selectedImage="require('../assets/shake1.png')"
          :normalImage="require('../assets/shake2.png')"
          >
          </tabbaricon>
         摇一摇
        </mt-tab-item>
        <mt-tab-item id="bbs" @click.native="changeState(3)">
          <tabbaricon
          :focused="currentIndex[3].isSelect"
          :selectedImage="require('../assets/bbs1.png')"
          :normalImage="require('../assets/bbs2.png')"
          >
          </tabbaricon>
        收藏
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="changeState(4)">
         <tabbaricon
          :focused="currentIndex[4].isSelect"
          :selectedImage="require('../assets/me1.png')"
          :normalImage="require('../assets/me2.png')"
          >
          </tabbaricon>
        我
        </mt-tab-item>

      </mt-tabbar>

    </div>
  </div>
</template>

<script>
// 引入子组件
import TabBarIcon from "./common/TabBarIcon.vue"
import Me from "./me/Me.vue"
import Collect from "./collect/Collect.vue"
import IndexDetail from "./home/IndexDetail.vue"
import Carousel from "./home/Carousel.vue"
import Sort from "./sort/Sort.vue"
import Shake from "./shake/Shake.vue"

export default {
  data(){
    return{
      active:"home",
      currentIndex:[
        {isSelect:true},
        {isSelect:false},
        {isSelect:false},
        {isSelect:false},
        {isSelect:false}
      ]
    }
  },
  components:{
    "tabbaricon":TabBarIcon,
    "me":Me,
    "collect" : Collect,
    "indexdetail": IndexDetail,
    "carousel" : Carousel,
    "sort" : Sort,
    "shake" : Shake
  },
  methods:{
     changeState(idx){
       for(var i=0; i<this.currentIndex.length;i++){
         if(idx==i){
           this.currentIndex[i].isSelect=true;
         }else{
           this.currentIndex[i].isSelect=false;
         }
       }

     },
     changeTabbar(active){
       this.active = active;
     }
  }
}
</script>

<style scoped>
.page-wrap{
  padding-bottom: 55px;
}
</style>
