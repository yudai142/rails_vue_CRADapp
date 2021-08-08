import Vue from 'vue'
import Vuex from 'vuex'
import router from '../router/router.js'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  // [state]がコンポーネントにおける[data]に相当
  state: {
    books: [],
    bookInfo: {},
    bookInfoBool: false
  },
  // [mutations]がコンポーネントにおける[methods]に相当
  mutations: {
    fetchBooks(state) {
      state.books = [];
      axios.get('/api/books').then((res) => {
        for(var i = 0; i < res.data.books.length; i++) {
          state.books.push(res.data.books[i]);
        }
      }, (error) => {
        console.log(error);
      });
    },
    setBookInfo(state, { id } ) {
      axios.get(`api/books/${id}.json`).then(res => {
        state.bookInfo = res.data;
        state.bookInfoBool = true;
      });
    },
    deleteBook(state, { id } ) {
      axios.delete(`/api/books/${id}`).then(res => {
        state.bookInfo = '';
        state.bookInfoBool = false;
      });
    }
  },
})