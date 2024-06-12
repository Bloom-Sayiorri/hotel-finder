import React, { useState } from 'react'

const Form = ({ onAddHotel }) => {
    const [ formData, setFormData ] = useState({
        name: '',
        location: '',
        image_url: '',
        amenities: '',
        ratings: 0,
        listings: ''
    });

    const handleChange = (e) => {
        const { type, name, value, checked } = e.target
        setFormData((prevData) => ({
            ...prevData,
            [name]: type === 'checkbox' ? checked : value,
        }));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const hotelData = {
            name: formData.name,
            location: formData.location,
            image_url: formData.image_url,
            amenities: formData.amenities,
            ratings: formData.ratings,
            listings: parseInt(formData.listings, 10)
        }
        fetch('/api/', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(hotelData)
        })
        .then((r) => r.json())
        .then((newHotel) => onAddHotel(newHotel))
    };

  return (
    <form onXubmit={handleSubmit}>
        <input
            type='text'
            name='username'
            id='username'
            placeholder='Enter your username'
            value={formData.username}
            onChange={handleChange}
        />

    </form>
  )
}

export default Form