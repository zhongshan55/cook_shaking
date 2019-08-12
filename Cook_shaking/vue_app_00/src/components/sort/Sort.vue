<template>
   <div>
        <!-- <div class="sort-selected">
        <mt-navbar class="page-part" v-model="selected">
            <mt-tab-item id="sort1">登录</mt-tab-item>
            <mt-tab-item id="sort2">注册</mt-tab-item>
            <mt-tab-item id="sort3">注册</mt-tab-item>
            <mt-tab-item id="sort4">注册</mt-tab-item>
            <mt-tab-item id="sort5">注册</mt-tab-item>
            <mt-tab-item id="sort6">注册</mt-tab-item>
        </mt-navbar>
        </div> -->
        <div class="navbar">
        <ul>
            <li>菜单1</li>
            <li>菜单2</li>
            <li>菜单3</li>
            <li>菜单4</li>
            <li>菜单5</li>
            <li>菜单6</li>
        </ul>
        </div>
   </div>
</template>
<script>
export default {
    data(){
        return{
            selected:"sort1"
        }
    }
}
</script>
<style scoped>
div.navbar{
    overflow:hidden;
    width:500px;
}
ul{
    list-style: none;
    display:flex;
    margin:0;
    padding:0;
    width: 600px;
    
}    
li{
    width: 100px;
    height: 30px;
    border:1px solid #ddd;
}
</style>