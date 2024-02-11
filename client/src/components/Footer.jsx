import React from 'react'
import { Link } from 'react-router-dom'

const Footer = () => {
  return (
    <footer className="flex items-center fixed bottom-0 mb-2 p-6">
        <div className='container '>
            <ul>
                <Link to={'/'}>Home</Link>
                <Link to={'/about'}>About</Link>
                <Link to={'/bookings'}>Bokokings</Link>
            </ul>
        </div>
    </footer>
  )
}

export default Footer