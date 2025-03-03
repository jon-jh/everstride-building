import { loadUserData } from "@/pages/api/stravaAPI";

export async function newStravaLogic() {
  console.log("➡️ newStravaLogic awaits pages>api>stravaAPI>loadUserData to pass it the parsed information");

  try {
    const data = await loadUserData();
    if (data) {
      // const totalDistanceToday = data.totalDistanceToday;
      // const totalDistanceThisWeek = data.totalDistanceThisWeek;
      // const totalDistance = data.totalDistance;
    } else {
      console.error("⛔ loadUserData in newStravaLogic failed.");
    }
  } catch (error) {
    console.error("⛔ loadUserData error:", error);
  }
}
