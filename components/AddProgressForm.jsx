"use client";
import { useState } from "react";

const AddProgressForm = ({ user, isDisabled }) => {
  const [distance, setDistance] = useState("");
  const [goldEarned, setGoldEarned] = useState(null);

  const handleSubmit = async (event) => {
    event.preventDefault();

    try {
      const response = await fetch("/api/userUpdater", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          userName: user.name,
          distance: parseFloat(distance),
        }),
      });

      // Adjusted the userUpdater backend to also send the goldEarned in the response.
      const result = await response.json();
      setGoldEarned(result.goldEarned || 0);
      setTimeout(() => {
        window.location.href = "/";
      }, 3000);
    } catch (error) {
      console.error("Error updating distance:", error);
    }
  };
  return (
    <div className="AddProgressDiv">
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={distance}
          placeholder="Enter Steps"
          onChange={(e) => setDistance(e.target.value)}
          disabled={isDisabled}
        />
        <button type="submit" disabled={isDisabled}>
          Walk
        </button>
      </form>
      {goldEarned !== null && goldEarned !== 0 && (
        <div className="gold-earned-notification">
          You walked {distance} steps! <br /> You got {goldEarned} gold!
        </div>
      )}
    </div>
  );
};

export default AddProgressForm;
