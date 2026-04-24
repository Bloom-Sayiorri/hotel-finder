import React from 'react'
import styles from '../styles/about.module.css'
import room from '../assets/room.jpg'

const About = () => {
  return (
    <div className={styles.container}>
      <section className={styles.imgSection}>
        <img src={room} alt="Room"/>
      </section>
      <section className={styles.textSection}>
        <p>
          Welcome to Hotel Findr, where innovation meets excellence. Since our founding, we have been committed to providing top-notch services and solutions to our clients.
        </p>
        <p>
          Our dedicated team of professionals brings together expertise, creativity, and a passion for delivering results that exceed expectations.
        </p>
        <p>
          Thank you for choosing Hotel Findr. We look forward to partnering with you on your journey to success. Together, we can achieve great things.
        </p>
      </section>
    </div>
  )
}

export default About