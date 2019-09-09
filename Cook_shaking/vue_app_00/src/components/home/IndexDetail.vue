<template>
  <div class="main">
    <!-- logo -->
    <div class="logoandlocation">
      美食天下
     <img src="../../../public/image/home/search.png" @click="go_search"/>
    </div>
    <div style="margin-top:50px;"></div>
    <!-- 轮播图 -->
    <carousel />

    <!-- 菜系分类 -->
    <div class="navbar">
      <div class="cake" >
        <!-- <router-link></router-link> -->
        <span>
          <img slot="icon" src="../../../public/image/home/cook01.png" alt @click="go_sort" :data-cooklist_id="1"/>
          <p>粤菜</p>
        </span>
        <!-- <span>粤菜</span> -->
      </div>
      <div class="cake" >
        <span>
          <img slot="icon" src="../../../public/image/home/cook02.png" alt  @click="go_sort" :data-cooklist_id="2" />
          <p>川菜</p>
        </span>
        <!-- <span>川菜</span> -->
      </div>
      <div class="cake">
        <span>
          <img slot="icon" src="../../../public/image/home/cook03.png" alt  @click="go_sort" :data-cooklist_id="3"/>
          <p>湘菜</p>
        </span>
        <!-- <span>湘菜</span> -->
      </div>
      <div class="cake">
        <span>
          <img slot="icon" src="../../../public/image/home/cook04.png" alt  @click="go_sort" :data-cooklist_id="4"/>
          <p>豫菜</p>
        </span>
        <!-- <span>浙菜</span> -->
      </div>
    </div>
    <!-- 热门菜系介绍 -->
    <div class="goods">
      <div class="news">
        <!-- 热门 更多 -->
        <div class="title">
          <h3><img src="../../../public/image/home/good.png" > 热门菜列</h3>
          <span @click="go_sort" :data-cooklist_id="1">
            更多 
            <img src="../../../public/image/home/right.png" alt />
          </span>
        </div>
        <!-- 菜系展示 -->
        <ul>
          <li v-for="(item,i) of list" :key="i">
            <div class="newsImg">
              <span>
                <img :src="host+item.pic" :data-cid="item.cid" @click="go_detail"/>
              </span>
            </div>
            <div class="detail" >
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
                  <div v-if="item.collect_status==1">
                    <img class="btnimg" src="http://127.0.0.1:3000/collect_active.png" />
                  </div>
                  <!-- 已收藏图标 -->
                  <div v-else>
                    <img class="btnimg" src="http://127.0.0.1:3000/collect.png" />
                  </div>

                </mt-button>
              </div>
              <div class="detailtext">
                <span>
                  <span class="ptitle">{{item.title}}</span>
                  <p class="psubtitle">{{item.subtitle}}</p>
                </span>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import carousel from "./Carousel";
export default {
  data() {
    return {
      list: [], //用于接收服务器端数据
      list_active: [] ///add_active 请求返回结果
    };
  },
  props:["focused"],
  methods: {
    //跳转搜索页面
    go_search(){
      this.$router.push("/search")
    },
    //跳转到详情页面
    go_detail(e){
      var cid=e.target.dataset.cid;
      this.$router.push(`/detail/${cid}`) 
      // console.log(cid)
    },
    //跳转到粤菜列表
    go_sort(e) {
      //获取选中的菜谱类型面板cooklist_id ,用于对应sort组件<mt-tab-container-item>的id
      var cooklist_id=e.currentTarget.dataset.cooklist_id;
      //$emit() :父组件绑定自定义的"getIndex"事件,子组件通过$emit()向父组件进行传值
      //向父组件传递sort    作用:底部导航显示"分类"模块
      //向父组件传递cooklist_id  作用:"分类"模块显示对应的面板id的菜谱类型
      this.$emit('getIndex',{sort:'sort',cooklist_id:cooklist_id});
    },
    addCollect(e) {
      //添加收藏夹
      //获取数据
      var fid = e.target.dataset.fid;
      var cid = e.target.dataset.cid;
      // console.log(cid)
      var title = e.target.dataset.title;
      var subtitle = e.target.dataset.subtitle;
      var detail = e.target.dataset.detail;
      var pic = e.target.dataset.pic;
      var href = e.target.dataset.href;

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
        this.load();
      });
    },
    load() {
      //首页信息加载
      var url = "home";
      this.axios.get(url).then(result => {
        this.list = result.data.data; //将数据传给list
        // console.log(this.list);
      });
    }

  },
  components: {
    carousel
  },
  created() {
    this.load(); //首页信息加载
    //  this.$nextTick()函数作用是等页面的数据更新完成以后，它再执行内部回调函数中的逻辑

  },
  watch:{
    focused(){
      this.load()
    }
  }
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
.main {
  overflow: hidden;
}
/*logo图片*/
.logoandlocation {
  position: fixed;
  width: 100%;
  height: 48px;
  background: #fff;
  border-bottom: 2px solid #f0f0f0;
  z-index: 999;
  /* padding: 5px 0; */
  text-align:center;
  line-height: 48px;
  /* box-sizing: border-box; */
  font-size: 20px;
  
}

.logoandlocation> img {
  width: 20px;
  height: 20px;
  position:absolute;
  right:15px;
  top:15px;
}

/*轮播图*/
.carousel {
  height: 222px;
  /* background: pink; */
}
.navbar {
  margin-top: 5px;
  display: flex;
  justify-content: space-around;
}
/* 字体大小 */
.navbar > div p {
  display: block;
  font-size: 12px;
  color: #d4ba92;
  text-align: center;
}
.navbar > div img{
  width: 30px;
}

/*  goods */
.goods {
  margin: 0 10px;
  margin-top: 10px;
  /* border-top: 1px solid #d4ba92; */
}
.goods > .news {
  border-top: 1px solid #f3e0c4;
  margin-top: 20px;
}
/* 新品 更多 */
.news {
  margin-top: 10px;
}
.news > .title {
  display: flex;
  justify-content: space-between;
  margin-top: 8px;
}
/* 新品 */
.news > .title > h3 {
  font-size: 14px;
  color: black;
  background: #f4ebe2;
  border-radius: 100px;
  font-weight: normal;
  padding: 3px 10px;
}
.news > .title > h3>img{
  vertical-align: -5px;
  width: 23px;
}
/* 更多 */
.news > .title > span {
  font-size: 16px;
  color: rgb(61, 51, 51);
  font-weight: normal;
}
/* ul 去除圆点 */
.news > ul {
  list-style: none;
}
/* a标签去除底线*/
a {
  text-decoration: none;
  color: black;
}
.newsImg {
  overflow: hidden;
  height:237px;
}
.newsImg > span > img {
  width: 100%;
}
.news > ul > li {
  box-shadow: 0px 1px 5px 0 #d4ba92;
  margin-bottom: 20px;
  border-radius: 5px;
  overflow: hidden;
}
.news > ul > li:first-child {
  margin-top: 10px;
}
.detailtext {
  width: 250px;
  text-align: left;
  margin-left: 15px;
  margin-top: 8px;
  margin-bottom: 10px;
}
.detailtext > span > .ptitle {
  font-size: 18px;
  color: #d4ba92;
  /* font-style: oblique; */
  margin-right: 5px;
}

.detailtext > span > .psubtitle {
  /*文字超出显示...*/
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  color:dimgrey;

  width: 250px;
  margin-top: 6px;
  margin-bottom: 5px;
  font-size: 14px;
}
.detail {
  position: relative;
}
.detailbtn {
  position: absolute;
  /* width: 32px;
    height: 32px; */
  border-radius: 50px;
  outline: 0;
  top: 50%;
  margin-top: -20px;
  left: 288px;
  /* border-radius: 50%; */
}
.detailbtn > .mint-button {
  position: relative;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  /* background-image: url("../../../public/image/home/collect.png"); */
  /* background-repeat:no-repeat; */
  /* background-position:center; */
}
.btnimg {
  position: absolute;
  display: block;
  left: 5px;
  top: 4px;
}
</style>

        
