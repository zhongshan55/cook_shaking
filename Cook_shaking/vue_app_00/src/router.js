import Vue from 'vue'
import Router from 'vue-router'
import Home from "./components/Home.vue"


//1:在router.js 引入组件
import Me from './components/me/Me.vue'
import Login from './components/me/Login.vue'
import Collect from './components/collect/Collect.vue'
// import IndexDetail from './components/home/IndexDetail.vue'
// import Carousel from './components/home/Carousel.vue'
import Sort from './components/sort/Sort.vue'
import User from './components/me/User.vue'  //用户详情
import Detail from './components/common/Detail.vue'
import Search from './components/home/Search'



Vue.use(Router)
export default new Router({
  routes: [
    //组件访问路径    组件名
    {path:'/Home',component:Home},
    {path:'/',component:Home},
    {path:'/Me',component:Me},
    {path:'/Login',component:Login},
    {path:'/Collect',component:Collect},
    // {path:'/IndexDetail',component:IndexDetail},
    // {path:'/Carousel',component:Carousel}
    {path:'/Sort/:fid',component:Sort},
    {path:'/User',component:User},
    {path:'/Detail/:cid',component:Detail,props:true},
    {path:'/Search',component:Search},


    

  ]
})
