import React, { useState } from 'react'
import '../styles/navbar.css'
import { NavLink } from 'react-router-dom'
import logo from '../assets/hotel.svg'
import { IoMenu } from "react-icons/io5";
import { RxAvatar } from "react-icons/rx";

const Navbar = () => {
  const [ isOpen, setIsOpen ] = useState(false);

  return (
    <header className="header">
      <div className='logo'>
        <img src={logo} alt="Logo" className="img"/>
        <p className="logo-header">Hotel Findr</p>
      </div>
      <nav className="nav">
        <NavLink to='/' activeclassname="active" className="nav-links hover">Home</NavLink>
        <NavLink to='/about' className="nav-links">About</NavLink>
        <NavLink to='/listings' className="nav-links">Listings</NavLink>
      </nav>
      <div className="toggle-btns">
        <IoMenu className="menu-btn" onClick={() => {setIsOpen(isOpen => !isOpen); console.log(isOpen);}}/>
        <RxAvatar className="avatar-btn" onClick={() => {}}/>
      </div>
    </header>
    
  )
}

export default Navbar