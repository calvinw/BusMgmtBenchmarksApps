import { useState } from 'react'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-50 gap-6">
      <h1 className="text-4xl font-bold text-gray-800">Hello, React + Tailwind</h1>
      <p className="text-gray-500">You clicked {count} times</p>
      <button
        onClick={() => setCount(count + 1)}
        className="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
      >
        Click me
      </button>
    </div>
  )
}

export default App
