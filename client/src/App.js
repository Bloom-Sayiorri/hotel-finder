// import { useEffect } from 'react';
import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Home from './pages/Home';
import About from './pages/About';
import Listings from './pages/Listings';

function App() {
  // const [ hotels, setHotels ] = useState([]);

  // useEffect(() => {
  //   fetch("/api/")
  //   .then((r) => r.json())
  //   .then((data) => console.log(data))
  // }, [])

  return (
    <BrowserRouter>
    <Navbar />
      <Routes>
        <Route exact path='/' element={<Home />}/>
        <Route exact path='/about' element={<About />}/>
        <Route exact path='/listings' element={<Listings />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
