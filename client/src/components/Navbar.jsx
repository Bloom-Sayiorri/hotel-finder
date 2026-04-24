import { useState } from 'react'
import styles from '../styles/navbar.module.css'
import { NavLink } from 'react-router-dom'
import { IoMenu } from "react-icons/io5";
import { RxAvatar } from "react-icons/rx";
import Logo from './Logo';

const Navbar = () => {
  const [ isOpen, setIsOpen ] = useState(false);

  return (
		<header className={styles.header}>
			<Logo />
			<nav className={styles.nav}>
				<NavLink to="/" activeclassname="active" className={`styles.nav-links hover`}>
					Home
				</NavLink>
				<NavLink to="/about" className={styles.navLinks}>
					About
				</NavLink>
				<NavLink to="/listings" className={styles.navLinks}>
					Listings
				</NavLink>
			</nav>
			<div className={styles.toggleBtns}>
				<IoMenu
					className={styles.menuBtn}
					onClick={() => {
						setIsOpen((isOpen) => !isOpen);
						console.log(isOpen);
					}}
				/>
				<RxAvatar className={styles.avatarBtn} onClick={() => {}} />
			</div>

			<div className={styles.mobileMenu}>
				<div className={styles.mobile}>
					<nav className={styles.mobileNav}>
						<NavLink to="/" className={`${styles.navLinks} hover`}>
							Home
						</NavLink>
						<NavLink to="/about">
							About
						</NavLink>
						<NavLink to="/listings">
							Listings
						</NavLink>
					</nav>
				</div>
			</div>
		</header>
	);
}

export default Navbar;