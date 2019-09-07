<template>
  <div>
    <mt-navbar v-model="selected" fixed>
      <mt-tab-item id="1" >川菜</mt-tab-item>
      <mt-tab-item id="2" >粤菜</mt-tab-item>
      <mt-tab-item id="3" >湘菜</mt-tab-item>
      <mt-tab-item id="4" >豫菜</mt-tab-item>
    </mt-navbar>
    <div style="margin-top:55px;"></div>
    <!-- tab-container -->
    <mt-tab-container v-model="selected" >
      <mt-tab-container-item id="1" >
        <!-- 川菜组件 -->
        <cooklist :fid="1" :update="focused"></cooklist>
      </mt-tab-container-item>
      <mt-tab-container-item id="2" >
      <cooklist :fid="2" :update="focused"></cooklist>
      </mt-tab-container-item>
      <mt-tab-container-item id="3" >
          <cooklist :fid="3" :update="focused"></cooklist>
      </mt-tab-container-item>
        <mt-tab-container-item id="4" >
          <cooklist :fid="4" :update="focused"></cooklist>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>

<script>
// 引入d
import Cooklist from "./Cooklist";
export default {
  data(){
    return{
      selected:"1"
    }
  },
  props:["cooklist_id","focused"],  //focused为导航当选中状态,选中为true,未选中为false
  methods:{
    load(){
      // console.log("cooklist_id"+this.cooklist_id);
      // console.log(this.focused)

    }
  },
  components:{
    // 注册
    "cooklist":Cooklist,
  },
  created(){
    this.load();
  },
  watch:{
    //监听cooklist_id值,改变是重新给selected赋值(切换面板)
    cooklist_id(){
       console.log("cooklist_id"+this.cooklist_id);
      this.selected=this.cooklist_id
      console.log("selected"+this.selected)
    },
    focused(){
      //  if(this.focused){
        //  this.load();
      //  }
    }
  }
}
</script>

<style scoped>
  
</style>