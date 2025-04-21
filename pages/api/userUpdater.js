import db from "@/db/connection";

export default async function userUpdater(req, res) {
  if (req.method !== "POST") {
    return res.status(405).json({ message: "Method not allowed" });
  }

  const { userName, distance } = req.body;

  if (!userName || !distance) {
    return res.status(400).json({ message: "Missing required fields" });
  }

  try {
    // Fetch user details from the database
    const selectUserQuery = `
      SELECT name, distance_travelled_today, total_distance_travelled, gold, accumulated_distance
      FROM users
      WHERE name = $1;
    `;
    const result = await db.query(selectUserQuery, [userName]);
    const user = result.rows[0];

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Destructure user data
    const {
      name,
      distance_travelled_today,
      total_distance_travelled,
      gold,
      accumulated_distance,
    } = user;

    // Calculate new values
    const parsedDistance = parseFloat(distance);
    const newDistanceTravelledToday =
      parseFloat(distance_travelled_today) + parsedDistance;
    const newTotalDistance = total_distance_travelled + parsedDistance;
    const goldEarned = Math.round(parsedDistance / 3);
    const newAccumulatedDistance =
      newDistanceTravelledToday > accumulated_distance
        ? newDistanceTravelledToday
        : accumulated_distance; // Prevent decrease in accumulated distance

    // Update user data in the database
    const updateUserQuery = `
      UPDATE users
      SET distance_travelled_today = $1,
          total_distance_travelled = $2,
          gold = gold + $3,
          accumulated_distance = $4
      WHERE name = $5;
    `;
    await db.query(updateUserQuery, [
      newDistanceTravelledToday,
      newTotalDistance,
      goldEarned,
      newAccumulatedDistance,
      name,
    ]);

    // Log updates for debugging
    console.log(`
      🔵 userUpdater ${name}:
      - Distance Within Quest: ${distance_travelled_today} -> ${newDistanceTravelledToday}
      - Total Distance: ${total_distance_travelled} -> ${newTotalDistance}
      - Gold Earned: +${goldEarned}
      - Accumulated Distance: ${accumulated_distance} -> ${newAccumulatedDistance}
    `);

    // Return success response
    res.status(200).json({ message: "Success", goldEarned });
  } catch (error) {
    console.error("⛔ Error updating user:", error.message);
    res
      .status(500)
      .json({ message: "Internal Server Error", error: error.message });
  }
}
