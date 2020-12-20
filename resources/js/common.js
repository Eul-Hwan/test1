export default {
    data() {
        return {

        }
    },
    methods: {
        async callApi(method, url, dataObj) {
            try {
                return await axios({
                    method: method,
                    url: url,
                    data: dataObj
                  });
            } catch (e) {
                // console.log(e)
                return e.response
            }
        },

        i(desc, title="Hey") {
            this.$Notice.info({
                title: title,
                desc: desc
            });
        },
        s(desc, title="Great!") {
            this.$Notice.success({
                title: title,
                desc: desc
            });
        },
        w(desc, title="Oops~!") {
            this.$Notice.warning({
                title: title,
                desc: desc
            });
        },
        e(desc, title="Oops~!") {
            this.$Notice.error({
                title: title,
                desc: desc
            });
        },
        swr(desc='먼가 잘못됬다. 확인해라~!', title="경고") {
            this.$Notice.error({
                title: title,
                desc: desc
            });
        },


    }
}