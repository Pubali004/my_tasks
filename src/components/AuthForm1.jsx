import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Auth = () => {
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
        await axios.post("http://localhost:9090/api/users", {
          name: formData.name,
          email: formData.email,
          phone: formData.phone,
        });
        alert("Registration Successful!");
        navigate("/alljobs");
      } catch (error) {
        alert("Error during registration.");
      }
    } else {
      try {
        const response = await axios.get(
          `http://localhost:9090/api/users?email=${formData.email}`
        );
        const user = response.data.find((u) => u.email === formData.email);
        if (user) {
          alert("Login Successful!");
          navigate("/alljobs");
        } else {
          alert("User not found!");
        }
      } catch (error) {
        alert("Error during login.");
      }
    }
  };

  const backgroundStyle = {
    backgroundColor:  "palegreen",
    minHeight: "100vh",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    
  };

  const containerStyle = {
    backdropFilter: "blur(20px)",
    backgroundColor: "black",
    border: "1px solid rgba(1, 3, 14, 0.3)",
    borderRadius: "16px",
    padding: "40px",
    width: "600px",
    height:"650px",
    color: "#fff",
    boxShadow: "32px 58px 32px 0 rgba(96, 38, 14, 0.37)",
    textAlign: "center",
    transition:"all ease in",
    text:"wrap",
        
  };

  const inputStyle = {
    width: "100%",
    padding: "10px",
    margin: "10px 0",
    border: "none",
    borderRadius: "8px",
    outline: "none",
  };

  const buttonStyle = {
    width: "100%",
    padding: "10px",
    marginTop: "10px",
    border: "none",
    borderRadius: "8px",
    backgroundColor: "#ffffff33",
    color: "#fff",
    fontWeight: "bold",
    cursor: "pointer",
    backdropFilter: "blur(4px)",
    
  };

  const switchButtonStyle = {
    ...buttonStyle,
    backgroundColor: "#ffffff22",
    marginTop: "20px",
  };

  return (
    <div style={backgroundStyle}>
      <div style={containerStyle}>
        <div><img src="src\assets\undraw_fingerprint-login_19qv.svg" height="180px" weight="400px"></img></div>

        <h2>{isRegister ? "Register" : "Login"}</h2>
        <form onSubmit={handleSubmit}>
          {isRegister && (
            <>
              <input
                type="text"
                name="name"
                placeholder="Name"
                value={formData.name}
                onChange={handleChange}
                style={inputStyle}
                required
              />
              <input
                type="text"
                name="phone"
                placeholder="Phone"
                value={formData.phone}
                onChange={handleChange}
                style={inputStyle}
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
            style={inputStyle}
            required
          />
          <input
            type="password"
            name="password"
            placeholder="Password"
            value={formData.password}
            onChange={handleChange}
            style={inputStyle}
            required
          />
          <button type="submit" style={buttonStyle}>
            {isRegister ? "Register" : "Login"}
          </button>
        </form>
        <button onClick={() => setIsRegister(!isRegister)} style={switchButtonStyle}>
          {isRegister ? "Switch to Login" : "Switch to Register"}
        </button>
      </div>
    </div>
  );
};

export default Auth;
