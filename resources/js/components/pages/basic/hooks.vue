<template>
    <div>
        <h1 ref="myref">Hook tutorial</h1>
        <h2>정말 노래잘하는 가수: {{name}}</h2>
    </div>
</template>

<script>
export default {
    data() {
        return {
            name : '아이유'
        }
    },

    beforeCreate() {
        console.log(this.name)
    },
    created() {
        // call mostly initial data from it...
        console.log('data and other function is avilable but not html', this.name)
    },
    mounted() {
        console.log(this.$refs.myref)
    }
}
</script>

<style scoped>

</style>
