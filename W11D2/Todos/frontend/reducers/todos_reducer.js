import {RECEIVE_TODOS} from "../actions/todo_actions"

const todosReducer = (oldState = {}, action) => {
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
    
    default:
        return oldState;
    }
}


export default todosReducer 