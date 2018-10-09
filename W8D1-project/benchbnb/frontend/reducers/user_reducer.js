/*jshint esversion: 6 */
import merge from 'lodash/merge';
import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

const usersReducer = (oldState = {}, action) => {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, oldState, {[action.user.id]: action.user});
    default:
      return oldState;
  }
};

export default usersReducer;
