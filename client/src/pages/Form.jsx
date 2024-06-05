import React, { useState } from 'react'

const Form = () => {
    const [ formData, setFormData ] = useState({
        username: '',

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