// import { useEffect } from 'react';
import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Home from './pages/Home';
import About from './pages/About';
import Listings from './pages/Listings';
import Footer from './components/Footer';

function App() {

  return (
    <BrowserRouter>
    <Navbar />
      <Routes>
        <Route exact path='/' element={<Home />}/>
        <Route exact path='/about' element={<About />}/>
        <Route exact path='/listings' element={<Listings />} />
      </Routes>
      <Footer />
    </BrowserRouter>
  );
}

export default App;
