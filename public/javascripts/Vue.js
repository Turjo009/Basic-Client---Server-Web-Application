Vue.createApp({
    data() {
      return {
        messages: []
      };
    },
    methods: {
      seeMessage() {
        let vm = this;
        let myxhttp = new XMLHttpRequest();
        myxhttp.onreadystatechange = function(){
            if(myxhttp.readyState === 4 || myxhttp.readyState === 200){
                let getResponse = JSON.parse(JSON.stringify(myxhttp.responseText));
                vm.messages = JSON.parse(getResponse);
                vm.testMessage = getResponse;

            }
        };
        myxhttp.open('GET', '/messageList', true);
        myxhttp.send();
      }
    },
    mounted() {
        this.seeMessage();
    }
}).mount('#seller');
