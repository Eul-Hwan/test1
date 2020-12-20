<template>
  <div>
      <div class="content">
          <div class="container-fluid">
                <h1>I will show how all other component react to changes</h1>
                <h2>The master component : {{ $store.state.counter }}</h2>
                <div>
                   <comA />
                </div>
                <div>
                   <comB />
                </div>
                <div>
                   <comC />
                </div>

                <Button type="info" @click="changeCounter">Change the state of the counter</Button>
          </div>
      </div>
  </div>
</template>

<script>
import comA from './comA'
import comB from './comB'
import comC from './comC'

export default {
    data() {
        return {
            // counter : 1000
        }
    },
    methods : {
        changeCounter() {
            this.$store.commit('changeTheCounter', 1)
        }
    },
    created() {
        // console.log(this.$store.state.counter)
    },
    components : {
        comA,
        comB,
        comC,
    }
}
</script>

<style scoped>

</style>
