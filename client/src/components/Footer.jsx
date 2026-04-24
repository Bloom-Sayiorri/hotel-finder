import React from "react";
import { NavLink } from "react-router-dom";
import styles from "../styles/footer.module.css";
import { FaXTwitter, FaInstagram } from "react-icons/fa6";

const Footer = () => {
	return (
		<footer className={styles.footer}>
			<div className={styles.container}>
				<p className={styles.text}>Hotel Findr All rights reserved.</p>
				<span style={{ color: "black", fontSize: "1.2rem" }}>&copy;</span>
			</div>
			<div className={styles.socials}>
				<NavLink to="https://instagram.com" className="">
					<FaXTwitter className={styles.twitter} />
				</NavLink>
				<NavLink to="https://instagram.com" className="">
					<FaInstagram className={styles.instagram} />
				</NavLink>
			</div>
		</footer>
	);
};

export default Footer;