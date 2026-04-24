import styles from "../styles/logo.module.css";
import logo from "../assets/hotel.svg";

export default function Logo() {
	return (
		<div className={styles.logo}>
			<img src={logo} alt="Logo" className={styles.img} />
			<p className={styles.logoHeader}>Hotel Findr</p>
		</div>
	);
}