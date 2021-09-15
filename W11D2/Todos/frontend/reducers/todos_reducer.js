import {RECEIVE_TODOS} from "../actions/todo_actions";
import {RECEIVE_TODO} from "../actions/todo_actions";
import {REMOVE_TODO} from "../actions/todo_actions";

const initialState = {
        1: {
            id: 1,
            title: 'take a shower',
            body: 'and be clean',
            done: false
        }
};

const todosReducer = (oldState = initialState, action) => {
    Object.freeze(oldState);
    const newState= Object.assign({}, oldState);
    switch (action.type) {
        case RECEIVE_TODOS:
            for(let i = 0; i< action.todos.length; i++) {
                newState[action.todos[i].id] = action.todos[i]
            }
            return newState;

        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo
            return newState;

        case REMOVE_TODO:
            delete newState[action.todo.id];
            return newState;
    
    default:
        return oldState;
    }
}


export default todosReducer 