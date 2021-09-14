import React from 'react';
import ReactDOM from 'react-dom';
// import todosReducer from './frontend/reducers/todos_reducer'

function Root(){
    return (
        <h1>Todos App</h1>
    )
}

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main");
    // window.todosReducer= todosReducer;
    ReactDOM.render(<Root/>, main);
});