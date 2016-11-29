import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';

import configureStore from './store/store';
import Root from './components/root';
// import { applyMiddleware } from 'redux';

// const addLoggingToDispatch = (store) => (next) => (action) => {
//   let dispatch = store.dispatch;
//   console.log(store.getState());
//   console.log(action);
//   let result = dispatch(action);
//   console.log(store.getState());
//   return result;
// };
//
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//
//   return Object.assign({}, store, { dispatch });
// };


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  // const newStore = applyMiddlewares(store, addLoggingToDispatch);
  ReactDOM.render(<Root store={store} />, rootEl);
});
