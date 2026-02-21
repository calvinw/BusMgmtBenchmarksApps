// src/components/TodoList.jsx
import React from 'react'
import { TodoItem } from './TodoItem'

export const TodoList = ({ todos, onToggle, onDelete }) => {
  if (todos.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        <p className="text-lg">No tasks yet. Add one above!</p>
      </div>
    )
  }

  return (
    <div className="mt-4">
      {todos.map(todo => (
        <TodoItem 
          key={todo.id} 
          todo={todo} 
          onToggle={onToggle} 
          onDelete={onDelete} 
        />
      ))}
      <div className="mt-4 text-sm text-gray-500 text-right">
        {todos.filter(t => !t.completed).length} items left
      </div>
    </div>
  )
}
