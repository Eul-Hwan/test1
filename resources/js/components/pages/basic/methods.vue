<template>
    <div>
        <!-- <h1>The number is : {{ counter }}</h1> -->
        <h1>The number is : {{ views }}</h1>
        <button @click="updateCounter(1)">Increase</button>
        <button @click="updateCounter(-1)">Decrease</button>
        <br>
        <br>
        <br>

        <div v-for="blog in blogs" :key="blog.id" v-if="blogs.length">
            <h1>{{ blog.title }}</h1>
            <p>{{ blog.post }}</p>
        </div>

        <br>
        <br>
        <br>

        <div>
            <h1 v-if="showItem">Show this item if "showItem" is true</h1>
            <h1 v-else>Show this item if "showItem" is false</h1>
        </div>

        <button @click="changeShowItem">Change showItem</button>
    </div>
</template>

<script>
export default {
    data() {
        return {
            // counter : 0
            views : 0,
            blogs : [],
            showItem : false
        }
    },
    methods: {
        updateCounter(number) {
            // this.counter += number
            this.views += number
        },
        changeShowItem() {
            this.showItem = !this.showItem
        }
    },

    created() {
        // call the server to get views of this blog post...
        this.views = 100
        // get the blog posts
        let posts = [
                {title: 'this is blog title 1', 'post' : 'this is the bolg post 1', id: 1},
                {title: 'this is blog title 2', 'post' : 'this is the bolg post 2', id: 2},
                {title: 'this is blog title 3', 'post' : 'this is the bolg post 3', id: 3},
                {title: 'this is blog title 4', 'post' : 'this is the bolg post 4', id: 4},
        ]

        this.blogs = posts
    }
}
</script>

<style scoped>

</style>
