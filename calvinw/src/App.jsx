import { useState } from 'react'
import { Header } from './components/Header'
import { TodoForm } from './components/TodoForm'
import { TodoList } from './components/TodoList'

function App() {
  const [todos, setTodos] = useState([])

  const addTodo = (text) => {
    setTodos([...todos, { id: Date.now(), text, completed: false }])
  }

  const toggleTodo = (id) => {
    setTodos(todos.map(todo => 
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    ))
  }

  const deleteTodo = (id) => {
    setTodos(todos.filter(todo => todo.id !== id))
  }

  return (
    <div className="min-h-screen bg-green-600 flex flex-col items-center justify-center p-4">
      <div className="w-full max-w-4xl space-y-8 bg-green-400 p-8 rounded-xl shadow-lg border border-green-500">
        <Header />
        <TodoForm onAdd={addTodo} />
        <TodoList 
          todos={todos} 
          onToggle={toggleTodo} 
          onDelete={deleteTodo} 
        />
      </div>
    </div>
  )
}

export default App
