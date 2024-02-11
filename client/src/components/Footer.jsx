import React from 'react'
import { Link } from 'react-router-dom'

const Footer = () => {
  return (
    <footer className="flex items-center fixed bottom-0 mb-2 p-6">
        <div className='links-left flex flex-col justify-start gap-3'>
            <Link to={'/'}>Home</Link>
            <Link to={'/about'}>About</Link>
            <Link to={'/bookings'}>Bookings</Link>
        </div>
        <div className='links-right flex flex-col justify-end float-right gap-3'>
            <Link to={'/'}>Home</Link>
            <Link to={'/about'}>About</Link>
            <Link to={'/bookings'}>Bookings</Link>
        </div>
    </footer>
  )
}

export default Footer