<template>
<div class="carousel">
   
    <mt-swipe @change="handleChange" :auto="3000" :show-indicators="true">
        <mt-swipe-item>
            <img src="../../../public/image/home/paigu.png" alt="">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../../public/image/home/yu.jpg" alt="">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../../public/image/home/zhe.jpg" alt="">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../../public/image/home/xiang.jpg" alt="">
        </mt-swipe-item>
    </mt-swipe>
    
</div>
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
    methods: {
        handleChange(){

        }
    },
}
</script>
<style scoped>
    img{
        width: 414px;
        height: 212px;
    }
</style>
