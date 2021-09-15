import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import todosReducer from './frontend/reducers/todos_reducer';
import { receiveTodo, receiveTodos, removeTodo } from './frontend/actions/todo_actions';
import { receiveSteps, receiveStep, removeStep } from './frontend/actions/step_actions';
function Root(){
    return (
        <h1>Todos App</h1>
    )
}

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main");
    window.todosReducer = todosReducer;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo = removeTodo;
    window.receiveSteps = receiveSteps;
    window.receiveStep = receiveStep;
    window.removeStep = removeStep;
    // window.store = configureStore();
    const store = configureStore();
    window.store = store;
    ReactDOM.render(<Root/>, main);
});