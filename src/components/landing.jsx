import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import './Landing.css';

const Landing = () => {
  const navigate = useNavigate();
  const [menuOpen, setMenuOpen] = useState(false);

  const toggleMenu = () => {
    setMenuOpen(!menuOpen);
  };

  return (
    <div className="landing-container">
      {/* Sidebar Navigation */}
      <nav className="navbar">
        <div className="navbar-logo">
          <img src="src/assets/undraw_in-the-office_e7pg.svg" alt="JobEasy Logo" height="500px" align="right"/>
          <span>JobEasy</span>
        </div>

        <div className="hamburger" onClick={toggleMenu}>
          &#9776;
        </div>

        <div className={`navbar-links ${menuOpen ? 'active' : ''}`}>
          <button onClick={() => navigate('')}>Home</button>
          <button onClick={() => navigate('/authform')}>Admin</button>
          <button onClick={() => navigate('/authform1')}>User</button>
          <button onClick={() => navigate('/condetails')}>Contacts</button>
          <button onClick={() => navigate('/chatbot')}>Chatbot</button>
        </div>
      </nav>

      <div className="main-content">
        {/* Hero Section */}
        <div className="hero-section">
          <marquee><h1>Welcome to JobEasy</h1></marquee>
          <p>Your gateway to finding the perfect job.</p>
          <img
            src="src/assets/undraw_professional-woman-avatar_ivds.svg"
            height={300}
            width={300} 
            alt="JobEasy" 
          />
        </div>

        {/* Home Section */}
        <section className="home-section">
          <h1>At JobEasy, we connect job seekers with employers efficiently and effectively.
          Explore our job listings and find the job that suits you!
          </h1>
        </section>

        {/* About Section */}
        <section className="about-section">
          <h1>About JobEasy</h1>
          <p>
           <h2> Our mission is to streamline the job search process, making it easier for both job seekers and employers to meet their needs. Join us and make job searching easier!</h2>
          </p>
        </section>

        {/* Cards Section */}
        <section className="cards-section">
          <h2>Why Choose JobEasy?</h2>
          <div className="cards-container">
            <div className="card">
              <h3>Easy Applications</h3>
              <p>Apply to jobs with a single click. No complicated forms or redundant questions.</p>
            </div>
            <div className="card">
              <h3>Verified Employers</h3>
              <p>We only work with verified companies to ensure safety and quality for job seekers.</p>
            </div>
            <div className="card">
              <h3>Real-Time Updates</h3>
              <p>Get notifications and updates in real-time so you never miss an opportunity.</p>
            </div>
          </div>
        </section>

        {/* Footer */}
        <footer className="footer">
          <p>© 2025 JobEasy. All rights reserved.</p>
        </footer>
      </div>
    </div>
  );
};

export default Landing;
