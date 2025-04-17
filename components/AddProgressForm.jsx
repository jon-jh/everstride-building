"use client";
import { useState } from "react";
import { newStravaLogic } from "@/pages/api/newStravaLogic";

const AddProgressForm = ({ user, isDisabled }) => {
  const [distance, setDistance] = useState("");

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
      const result = await response.json();
      window.location.href = "/";
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
    </div>
  );
};

export default AddProgressForm;
