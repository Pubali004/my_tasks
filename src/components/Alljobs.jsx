import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Alljobs = () => {
  const [tasks, setTasks] = useState([]);
  const navigate = useNavigate();

  // Fetch tasks from backend
  useEffect(() => {
    axios
      .get("http://localhost:9090/api/tasks")
      .then((response) => {
        setTasks(response.data);
      })
      .catch((error) => {
        console.error("Error fetching tasks:", error);
      });
  }, []);

  return (
    <div style={styles.container}>
      <h1>Jobs List</h1>
      <ul style={styles.taskList}>
        {tasks.length > 0 ? (
          tasks.map((task) => (
            <li key={task.id} style={styles.taskItem}>
              <h3>{task.title}</h3>
              <p>{task.description}</p>
              <button 
                onClick={() => navigate('/appli-lists', { state: { job: task } })} 
                style={{ padding: "10px", backgroundColor: "#007bff", color: "white", borderRadius: "5px", cursor: "pointer" }}
              >
                Apply
              </button>
              

            </li>
          ))
        ) : (
          <p>No Jobs available.</p>
        )}
      </ul>
    </div>
  );
};

// Basic Styles
const styles = {
  container: {
    width: "400px",
    margin: "50px auto",
    padding: "20px",
    textAlign: "center",
    border: "10px solid brown",
    borderRadius: "5px"
  },
  taskList: {
    listStyleType: "none",
    padding: 0,
  },
  taskItem: {
    backgroundColor: "green",
    padding: "10px",
    margin: "10px 0",
    borderRadius: "5px",
  },
};

export default Alljobs;
