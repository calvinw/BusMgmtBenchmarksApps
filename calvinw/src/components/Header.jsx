// src/components/Header.jsx
import React from 'react'

export const Header = () => {
  return (
    <header className="mb-8 text-center">
      <h1 className="text-4xl font-extrabold text-gray-900 tracking-tight sm:text-5xl md:text-6xl">
        <span className="block xl:inline">Task Manager</span>
      </h1>
      <p className="mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl">
        Organize your day, one task at a time.
      </p>
    </header>
  )
}
