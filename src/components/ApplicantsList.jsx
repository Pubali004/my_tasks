import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./applicant.css";

const ApplicantForm = () => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    name: "",
    experience: "",
    companyName: "",
    jobRole: "",
    resume: null,
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setFormData((prev) => ({ ...prev, resume: reader.result }));
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const existing = JSON.parse(localStorage.getItem("applications")) || [];
    localStorage.setItem("applications", JSON.stringify([...existing, formData]));
    alert("Application submitted!");
    navigate("/");
  };

  return (
    <div className="form-container">
      <h2>Job Application Form</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Name:
          <input type="text" name="name" required value={formData.name} onChange={handleChange} />
        </label>

        <label>
          Experience (in years):
          <input type="number" name="experience" required value={formData.experience} onChange={handleChange} />
        </label>

        <label>
          Company Name:
          <input type="text" name="companyName" required value={formData.companyName} onChange={handleChange} />
        </label>

        <label>
          Job Role:
          <input type="text" name="jobRole" required value={formData.jobRole} onChange={handleChange} />
        </label>

        <label>
          Upload Resume:
          <input type="file" accept=".pdf,.doc,.docx" onChange={handleFileChange} required />
        </label>

        <button type="submit">Submit Application</button>
      </form>
    </div>
  );
};

export default ApplicantForm;
