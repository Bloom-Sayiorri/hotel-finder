import { useState } from 'react'
import styles from '../styles/search.module.css'

export default function Search() {
    const [ search, setSearch ] = useState('')

    const handleSubmit = (e) => {
        e.preventDefault();
    }

    const handleChange = (e) => {
        setSearch(e.target.value)
    }

    return (
        <div className={styles.container}>
            <form onSubmit={handleSubmit}>
                <input
                    type='search'
                    name='search'
                    value={search}
                    placeholder='Search...'
                    onChange={handleChange}
                />
            </form>
        </div>
    );
}

/* 
Blaauwberg House on the beach in Bloubergstrand
Grande Bay
Relaxed beach living in style
Self catering apartment
Aurora Self Catering Units, Durbanville, Cape Town
In hip designer district of Cape T.
Hollywood Mansion & Spa Camps Bay with Butler
idyllic private Cottage, cleaning weekdays incl.
Rooms in Halaal Villa Cape Town De Tijger
Largo House self catering suite
2 bed home with a view under Table Mountain.
Apartment in Durbanville
Private Room
Double Bedr0om to Rent
Villa Honeywood Residence 5 star Service
Light and Bright Somerset
*/