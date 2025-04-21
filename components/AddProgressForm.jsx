"use client";
import { useState } from "react";
import { newStravaLogic } from "@/pages/api/newStravaLogic";

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
      setGoldEarned(result.goldEarned)
      setTimeout(() => {
      window.location.href = "/";  
      }, 2000);
    } catch (error) {
      console.error("Error updating distance:", error);
    }
  };

  const isStrava = user.name === "Jon Hiebert";

  return (
    <div className="AddProgressDiv">
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={distance}
          onChange={(e) => setDistance(e.target.value)}
          disabled={isDisabled || isStrava}
        />
        <button type="submit" disabled={isDisabled || isStrava}>
          Add Steps
        </button>
        <button
          type="button"
          disabled={isDisabled || user.name !== "Jon Hiebert"}
          onClick={() => {
            newStravaLogic();
            window.location.reload();
          }}
        >
          Check Strava
        </button>
      </form>
      {goldEarned !== null && (
        <div className="gold-earned-notification">
          You walked {distance} steps! <br /> You got {goldEarned} gold!
        </div>
      )}
    </div>
  );
};

export default AddProgressForm;
