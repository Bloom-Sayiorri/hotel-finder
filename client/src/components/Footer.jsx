import React from 'react'
import '../styles/footer.css'
import { FaXTwitter, FaInstagram } from "react-icons/fa6";

const Footer = () => {
  return (
    <footer className='footer'>
      <div className='container'>
        <p className='text'>
          <span style={{color: "blue"}}>&copy;</span> Hotel Findr All rights reserved.
        </p>
      </div>
      <div className='socials'>
        <FaXTwitter className='twitter'/>
        <FaInstagram className='instagram'/>
      </div>
    </footer>
  )
}

export default Footer