"use client";
import "./Login.css";
import { useState } from "react";

const Login = () => {
  console.log("🟠 HOME app>page.jsx. username cookie is not set. SHOW LOGIN.");

  // Usestate for the form...
  const [username, setUsername] = useState("");

  const handleLogin = async () => {
    try {
      await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username }),
      });

      window.location.reload();
    } catch (error) {
      console.error("Error during login or initialization:", error);
    }
  };

  return (
    <div className="Login">
      <select value={username} onChange={(e) => setUsername(e.target.value)}>
        <option value="">Choose Player</option>
        <option value="Kyle McParland">Kyle</option>
        <option value="Jon Hiebert">Jon</option>
        <option value="Ben Hallam">Ben</option>
      </select>
      <button onClick={handleLogin} disabled={!username}>
        Choose
      </button>
    </div>
  );
};

export default Login;
