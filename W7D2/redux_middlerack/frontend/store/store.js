import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const preloadedState = {
  notes: [],
  tracks: {},
  isRecording: false,
  isPlaying: false
};

const configureStore = (preloadedState1) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
  )
);

const addLoggingToDispatch = (store) => (next) => (action) => {
  let dispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let result = dispatch(action);
  console.log(store.getState());
  return result;
};


const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
};

export default configureStore;
