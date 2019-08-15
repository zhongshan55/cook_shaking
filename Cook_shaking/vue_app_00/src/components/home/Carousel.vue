<template>
<div class="carousel">
   
    <mt-swipe @change="handleChange" :auto="3000" :show-indicators="true">
        <mt-swipe-item v-for="(item,i) of list" :key="i">
            <a href="javascript:;">
                <img :src="`http://127.0.0.1:3000/`+item.pic" alt="">
            </a>
            <!-- <img src="../../../public/image/home/paigu.png" alt=""> -->
        </mt-swipe-item>

        <!-- <mt-swipe-item>
            <a href="javascript:;"></a>
            <img src="../../../public/image/home/yu.jpg" alt="">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../../public/image/home/zhe.jpg" alt="">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../../public/image/home/xiang.jpg" alt="">
        </mt-swipe-item> -->
    </mt-swipe>
    
</div>
</template>
<script>
export default {
    data() {
        return {
            list:[],
        }
    },
    methods: {
        handleChange(){     },
        //轮播图加载方法
        loadcarousel(){
            var url="carousel"
            this.axios.get(url).then(result=>{
                this.list=result.data.data;
                // console.log(this.list)
            })
        }
    },

    created() {
        this.loadcarousel();
    },
}
</script>
<style scoped>
    img{
        width: 414px;
        height: 212px;
    }
</style>
