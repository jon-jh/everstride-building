"use client";

import { useState } from "react";

const AddProgressForm = ({ user }) => {
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
      <p>How many steps or meters?</p>
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={distance}
          onChange={(e) => setDistance(e.target.value)}
          disabled={user.name === "Jon Hiebert"}
        />
        <button type="submit" disabled={user.name === "Jon Hiebert"}>
          ADD
        </button>
      </form>
    </div>
  );
};

export default AddProgressForm;
