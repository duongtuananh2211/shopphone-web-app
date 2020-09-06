import './bootstrap';

import App from './views/App'
// import vue router, component và routes
import Vue from 'vue';
import VueRouter from 'vue-router';
import routes from './routes';
import vuetify from "./plugins/vuetify";

// use router
Vue.use(VueRouter);


// khai báo dùng router này
const router = new VueRouter({
    routes,
    mode: 'history'
});

// và cuối cùng là tạo 1 instance Vue và render tại phần tử có id là app,
// render tại component App và dùng router đã khai báo ở trên
const app = new Vue({
    el: '#app',
    vuetify,
    render: h => h(App),
    router
});
