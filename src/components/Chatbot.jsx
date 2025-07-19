import React, { useState } from "react";

// const API_KEY = "" ;
const API_URL = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${API_KEY}`;

const Chatbot = () => {
  const [messages, setMessages] = useState([
    { sender: "bot", text: "Hi! Ask me anything 🤖" },
  ]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);

  const sendToGemini = async (userInput) => {
    const requestBody = {
      contents: [
        {
          parts: [{ text: userInput }],
          role: "user",
        },
      ],
    };

    try {
      const response = await fetch(API_URL, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(requestBody),
      });

      const data = await response.json();
      const botMessage =
        data?.candidates?.[0]?.content?.parts?.[0]?.text || "I couldn't get a response.";
      return botMessage;
    } catch (error) {
      console.error("Gemini API error:", error);
      return "Sorry, something went wrong!";
    }
  };

  const handleSend = async () => {
    if (!input.trim()) return;

    const userMessage = { sender: "user", text: input };
    setMessages((prev) => [...prev, userMessage]);
    setInput("");
    setLoading(true);

    const botReply = await sendToGemini(input);
    setMessages((prev) => [...prev, { sender: "bot", text: botReply }]);
    setLoading(false);
  };

  return (
    <div style={styles.container}>
      <h2 style={styles.header}> Help Corner</h2>
      <div style={styles.chatBox}>
        {messages.map((msg, index) => (
          <div
            key={index}
            style={{
              ...styles.message,
              alignSelf: msg.sender === "user" ? "flex-end" : "flex-start",
              backgroundColor: msg.sender === "user" ? "#4caf50" : "#444",
            }}
          >
            {msg.text}
          </div>
        ))}
        {loading && <div style={styles.loading}>Typing...</div>}
      </div>
      <div style={styles.inputArea}>
        <input
          type="text"
          placeholder="Type a message..."
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => e.key === "Enter" && handleSend()}
          style={styles.input}
        />
        <button onClick={handleSend} style={styles.button}>Send</button>
      </div>
    </div>
  );
};

const styles = {
  container: {
    maxWidth: "500px",
    margin: "40px auto",
    padding: "20px",
    background: "maroon",
    borderRadius: "10px",
    color: "#fff",
    fontFamily: "Arial, sans-serif",
    boxShadow: "0 0 15px rgba(0, 0, 0, 0.84)",
  },
  header: {
    textAlign: "center",
    marginBottom: "15px",
  },
  chatBox: {
    height: "400px",
    overflowY: "auto",
    display: "flex",
    flexDirection: "column",
    gap: "10px",
    padding: "10px",
    border: "1px solid #333",
    borderRadius: "8px",
    background: "royalblue",
    marginBottom: "10px",
  },
  message: {
    padding: "10px 14px",
    borderRadius: "15px",
    maxWidth: "80%",
    whiteSpace: "pre-wrap",
  },
  inputArea: {
    display: "flex",
    gap: "10px",
  },
  input: {
    flex: 1,
    padding: "10px",
    borderRadius: "6px",
    border: "none",
    outline: "none",
  },
  button: {
    padding: "10px 20px",
    borderRadius: "6px",
    border: "none",
    backgroundColor: "#4caf50",
    color: "#fff",
    fontWeight: "bold",
    cursor: "pointer",
  },
  loading: {
    fontStyle: "italic",
    color: "#aaa",
    fontSize: "14px",
    marginLeft: "10px",
  },
};

export default Chatbot;
