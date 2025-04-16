"use client";
import { useState } from "react";

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

  return (
    <div className="AddProgressDiv">
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={distance}
          onChange={(e) => setDistance(e.target.value)}
          disabled={isDisabled}
        />
        <button type="submit" disabled={isDisabled}>
          Add Steps
        </button>
      </form>
    </div>
  );
};

export default AddProgressForm;
