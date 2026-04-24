import React, { useEffect, useState } from "react";

const Listings = () => {
	const [listings, setListings] = useState([]);
	useEffect(() => {
		fetch("http://localhost:3000/listings")
			.then((res) => res.json())
			.then((data) => setListings(data))
			.catch((error) => console.log(error));
	}, []);
	return (
		<div>
			{/* Display hotel information here */}
			{listings}
		</div>
	);
};

export default Listings;