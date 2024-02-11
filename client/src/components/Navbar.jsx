import React from 'react'
import { Link } from 'react-router-dom'

const Navbar = () => {
  return (
    <div>
      <header className="flex justify-between bg-blue-200">
        <h1 className="">Hotel</h1>
        <nav className="flex mr-0 pt-0 pr-4 gap-3">
          <Link to={"/"}>Home</Link>
          <Link to={"/about"}>About</Link>
        </nav>
      </header>
    </div>
  )
}

export default Navbar