import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const AllApplicants = () => {
  const [applicants, setApplicants] = useState([]);
  const [filterText, setFilterText] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const storedApplications = JSON.parse(localStorage.getItem("applications")) || [];
    setApplicants(storedApplications);
  }, []);

  // Filtered list based on name, job role, or company
  const filteredApplicants = applicants.filter(applicant =>
    [applicant.name, applicant.jobRole, applicant.companyName]
      .some(field => field.toLowerCase().includes(filterText.toLowerCase()))
  );

  const clearAllData = () => {
    localStorage.clear();
    setApplicants([]);
  };

  return (
    <div style={{
      maxWidth: "600px",
      margin: "50px auto",
      padding: "30px",
      backgroundColor: "#f9f9f9",
      borderRadius: "10px",
      border: "2px solid #ddd",
      boxShadow: "0 4px 10px rgba(0,0,0,0.1)",
      fontFamily: "Arial, sans-serif"
    }}>
      <h2 style={{ textAlign: "center", marginBottom: "20px" }}>All Applicants</h2>

      <input
        type="text"
        placeholder="Filter by name, job role, or company"
        value={filterText}
        onChange={(e) => setFilterText(e.target.value)}
        style={{
          width: "100%",
          padding: "10px",
          marginBottom: "20px",
          border: "1px solid #ccc",
          borderRadius: "5px"
        }}
      />

      {filteredApplicants.length > 0 ? (
        filteredApplicants.map((applicant, index) => (
          <div key={index} style={{
            padding: "15px",
            marginBottom: "20px",
            backgroundColor: "#fff",
            border: "1px solid #ccc",
            borderRadius: "8px"
          }}>
            <p><strong>Name:</strong> {applicant.name}</p>
            <p><strong>Experience:</strong> {applicant.experience} years</p>
            <p><strong>Company:</strong> {applicant.companyName}</p>
            <p><strong>Job Role:</strong> {applicant.jobRole}</p>

            {applicant.resume ? (
              <a
                href={applicant.resume}
                download={`${applicant.name}_resume`}
                style={{
                  display: "inline-block",
                  marginTop: "8px",
                  color: "white",
                  backgroundColor: "#28a745",
                  padding: "8px 12px",
                  borderRadius: "5px",
                  textDecoration: "none",
                  fontWeight: "bold"
                }}
              >
                Download Resume
              </a>
            ) : (
              <p style={{ color: "gray", marginTop: "8px" }}>No resume uploaded.</p>
            )}
          </div>
        ))
      ) : (
        <p style={{ textAlign: "center" }}>No applicants found.</p>
      )}

      <button
        onClick={() => navigate("/")}
        style={{
          display: "block",
          width: "100%",
          padding: "10px",
          marginTop: "20px",
          backgroundColor: "#007bff",
          color: "white",
          fontSize: "16px",
          border: "none",
          borderRadius: "5px",
          cursor: "pointer"
        }}
      >
        Back
      </button>

      <button
        onClick={clearAllData}
        style={{
          display: "block",
          width: "100%",
          padding: "10px",
          marginTop: "10px",
          backgroundColor: "#dc3545",
          color: "white",
          fontSize: "16px",
          border: "none",
          borderRadius: "5px",
          cursor: "pointer"
        }}
      >
        Clear All Data
      </button>
    </div>
  );
};

export default AllApplicants;
