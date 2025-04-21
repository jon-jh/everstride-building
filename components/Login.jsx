"use client";
import "./Login.css";
import { useState } from "react";

const Login = () => {
  console.log("🟠 HOME app>page.jsx. username cookie is not set. SHOW LOGIN.");

  // Usestate for the form...
  const [username, setUsername] = useState("");
  const [loading, setLoading] = useState(false);

  // Strava data is loaded inside this handleLogin block by pages/api/login.js before opening the home page.

  const handleLogin = async () => {
    setLoading(true);
    try {
      await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username }),
      });

      window.location.reload();
    } catch (error) {
      console.error("Error during login or initialization:", error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="Login">
      <select value={username} onChange={(e) => setUsername(e.target.value)}>
        <option value="">Choose Player</option>
        <option value="Kyle McParland">Kyle - Everstride Only</option>
        <option value="Jon Hiebert">Jon - With Phone App</option>
        <option value="Ben Hallam">Ben - Everstride Only</option>
      </select>
      <button onClick={handleLogin} disabled={!username}>
        Choose
      </button>

      <div className="Loading">{loading && <h1>Loading</h1>}</div>
    </div>
  );
};

export default Login;
