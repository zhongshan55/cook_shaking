<template>
  <div>
    <mt-navbar v-model="selected" fixed>
      <mt-tab-item id="1">川菜</mt-tab-item>
      <mt-tab-item id="2">粤菜</mt-tab-item>
      <mt-tab-item id="3">湘菜</mt-tab-item>
      <mt-tab-item id="4">湘菜</mt-tab-item>
      <mt-tab-item id="5">湘菜</mt-tab-item>
      <mt-tab-item id="6">湘菜</mt-tab-item>
      <mt-tab-item id="7">湘菜</mt-tab-item>
      <mt-tab-item id="8">湘菜</mt-tab-item>
    </mt-navbar>
    <div style="margin-top:55px;"></div>
    <!-- tab-container -->
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <!-- 川菜组件 -->
        <sichuan></sichuan>
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <yuecai></yuecai>
      </mt-tab-container-item>
      <mt-tab-container-item id="3">
        333
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>

<script>
// 引入
import Sichuan from "./Sichaun";
import Yuecai from "./Yuecai";
export default {
  data(){
    return{
      selected:"1"
    }
  },
  components:{
    // 注册
    "sichuan":Sichuan,
    "yuecai":Yuecai,
  }
}
</script>

<style scoped>
  
</style>