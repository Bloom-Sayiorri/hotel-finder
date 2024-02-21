import React from 'react'
import about_img from '../assets/about_img.jpg'

const About = () => {
  return (
    <div className="flex flex-row justify-center items-center m-8">
      <section className="flex flex-col justify-center items-center text-lg leading-loose overflow-normal">
        {/* mb-8 not working in parent section*/}
        <p className='mb-2'>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate blanditiis magni similique molestiae, quam quia earum libero dicta unde voluptates ex sit ipsam. Fugit quaerat porro enim tempore? Nesciunt, quam.
        </p>
        <p className='mb-2'>
          Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente natus molestiae incidunt accusamus ratione, maxime culpa tempora distinctio cum eligendi veniam libero, corporis fugiat eaque ipsam cumque quaerat fugit nesciunt?
        </p>
        <p>
          Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente natus molestiae incidunt accusamus ratione, maxime culpa tempora distinctio cum eligendi veniam libero, corporis fugiat eaque ipsam cumque quaerat fugit nesciunt?
        </p>
      </section>
      <img className="h-full w-1/2 rounded" src={about_img}alt="About"/>
    </div>
  )
}

export default About