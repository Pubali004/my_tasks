import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import "./AuthPage.css"; 

const AuthPage = () => {
  const [isRegister, setIsRegister] = useState(false);
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    phone: "",
    password: "",
  });

  const navigate = useNavigate();

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (isRegister) {
      try {
        await axios.post("http://localhost:9090/api/admins", {
          name: formData.name,
          email: formData.email,
          phone: formData.phone,
        });
        alert("Registration Successful!");
        navigate("/alltasks");
      } catch (error) {
        alert("Error during registration.");
      }
    } else {
      try {
        const response = await axios.get(
          `http://localhost:9090/api/admins?email=${formData.email}`
        );
        const admin = response.data.find((u) => u.email === formData.email);
        if (admin) {
          alert("Login Successful!");
          navigate("/alltasks");
        } else {
          alert("User not found!");
        }
      } catch (error) {
        alert("Error during login.");
      }
    }
  };

  return (
    <div className="auth-background">
      
      <div className="auth-container">
        <div className="auth-img"> <img src="src\assets\undraw_in-the-office_e7pg.svg"height = "300px" width="300px" alt="j" align="right"></img></div>
        <h2>{isRegister ? "Register" : "Login"}</h2>
        <form onSubmit={handleSubmit} className="auth-form">
          {isRegister && (
            <>
              <input
                type="text"
                name="name"
                placeholder="Name"
                value={formData.name}
                onChange={handleChange}
                required
              />
              <input
                type="text"
                name="phone"
                placeholder="Phone"
                value={formData.phone}
                onChange={handleChange}
                required
              />
            </>
          )}
          <input
            type="email"
            name="email"
            placeholder="Email"
            value={formData.email}
            onChange={handleChange}
            required
          />
          <input
            type="password"
            name="password"
            placeholder="Password"
            value={formData.password}
            onChange={handleChange}
            required
          />
          <button type="submit">
            {isRegister ? "Register" : "Login"}
          </button>
        </form>
        <button
          onClick={() => setIsRegister(!isRegister)}
          className="switch-btn"
        >
          {isRegister ? "Switch to Login" : "Switch to Register"}
        </button>
      </div>
      <div>
       
      </div>
    </div>
  );
};

export default AuthPage;
