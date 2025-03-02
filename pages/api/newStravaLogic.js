import { loadUserData, getUserName } from "@/pages/api/stravaAPI";

export async function runTestPageLogic() {
  const userName = getUserName();

  console.log(
    "\n🟢➡️ runTestPageLogic called, hardcoded to user " +
      JSON.stringify({ userName })
  );

  try {
    console.log(
      "🟢➡️ pages>api>stravaAPI> loadUserData called - data=loadUserData"
    );

    const data = await loadUserData();
    if (data) {
      // console.log("loadUserData");
      // const totalDistanceToday = data.totalDistanceToday;
      // const totalDistanceThisWeek = data.totalDistanceThisWeek;
      // const totalDistance = data.totalDistance;
      // console.log(`Total distance today: ${totalDistanceToday} meters`);
      // console.log(`Total distance this week: ${totalDistanceThisWeek} meters`);
      // console.log(`Total distance since sign-up: ${totalDistance} meters`);
    } else {
      console.error("⛔ loadUserData in runTestPageLogic failed.");
    }
  } catch (error) {
    console.error("⛔ loadUserData error:", error);
  }
}
