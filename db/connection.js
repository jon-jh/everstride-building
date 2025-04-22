const { Pool } = require("pg");
require("dotenv").config();

const db = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false }, // Required for Supabase
});


// Function to update the distance traveled today for a user
db.updateDistance = async (userName, distance) => {
  try {
    const updateQuery = `
      UPDATE users
      SET distance_travelled_today = $1
      WHERE name = $2;
    `;
    await db.query(updateQuery, [distance, userName]);
  } catch (err) {
    console.error(`Error updating distance for user ${userName}:`, err);
  }
};

module.exports = db;

