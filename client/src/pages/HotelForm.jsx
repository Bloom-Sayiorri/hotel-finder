import React, { useState } from "react";
import styles from "../styles/hotelform.module.css";

const Form = ({ onAddHotel }) => {
	const [formData, setFormData] = useState({
		hostId: 0,
		title: "",
		description: "",
		price: 0,
		neighborhood_overview: "",
		picture_url: "",
		neighbourhood: "",
		neighbourhood_cleansed: "",
		neighbourhood_group: "",
		lat: 0,
		lng: 0,
		property_type: "",
		room_type: "",
		accommodates: 0,
		bathrooms: 0,
		amenities: "",
		minimum_nights: 0,
		maximum_nights: 0,
		availability_30: 0,
		availability_60: 0,
		availability_90: 0,
		availability_365: 0,
		number_of_reviews: 0,
		first_review: Date.now(),
		last_review: Date.now(),
		review_scores_rating: 0,
		review_scores_accuracy: 0,
		review_scores_cleanliness: 0,
		review_scores_checkin: "",
		review_scores_communication: 0,
		review_scores_location: 0,
		review_scores_value: 0,
		instant_bookable: false,
		reviews_per_month: 0,
		bathrooms_text: "",
		bedrooms: 0,
		beds: 0,
	});

	const handleChange = (e) => {
		const { type, name, value, checked } = e.target;
		setFormData((prevData) => ({
			...prevData,
			[name]: type === "checkbox" ? checked : value,
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
			listings: parseInt(formData.listings, 10),
		};
		fetch("/api/", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify(hotelData),
		})
			.then((r) => r.json())
			.then((newHotel) => onAddHotel(newHotel));
	};

	return (
		<div className={styles.container}>
			<div className={styles.header}></div>
			<form onSubmit={handleSubmit} className={styles.form}>
				<input
					type="text"
					name="username"
					id="username"
					placeholder="Enter your username"
					value={formData.username}
					onChange={handleChange}
                    className={styles.username}
				/>
			</form>
		</div>
	);
};

export default Form;