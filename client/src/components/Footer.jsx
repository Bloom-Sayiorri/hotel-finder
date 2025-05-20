import React from 'react'
import '../styles/footer.css'
import { FaXTwitter, FaInstagram } from "react-icons/fa6";

const Footer = () => {
  return (
    <footer className='footer'>
      <div className='container'>
        <p className='text'>Hotel Findr All rights reserved.</p>
        <span style={{color: "blue", fontSize: "2em"}}>&copy;</span>
      </div>
      <div className='socials'>
        <FaXTwitter className='twitter'/>
        <FaInstagram className='instagram'/>
      </div>
    </footer>
  )
}

export default Footer