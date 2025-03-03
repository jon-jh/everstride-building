import { accessToken, newAccessToken, userName } from "./stravaUserInfo";

// Function to grab userName
export function getUserName() {
  return userName;
}

// Function to filter activities by this week only:
export function getTotalDistanceThisWeek(activities) {
  const today = new Date();
  const startOfWeek = new Date(today);
  startOfWeek.setDate(today.getDate() - today.getDay());
  return activities
    .filter((activity) => {
      const activityDate = new Date(activity.start_date);
      return activityDate >= startOfWeek && activityDate <= today;
    })
    .reduce((total, activity) => total + activity.distance, 0);
}

// Function to filter activities by today only:
export function getTotalDistanceToday(activities) {
  const today = new Date();
  const startOfToday = new Date(today);
  startOfToday.setHours(0, 0, 0, 0);
  const endOfToday = new Date(today);
  endOfToday.setHours(23, 59, 59, 999);
  return activities
    .filter((activity) => {
      const activityDate = new Date(activity.start_date);
      return activityDate >= startOfToday && activityDate <= endOfToday;
    })
    .reduce((total, activity) => total + activity.distance, 0);
}

// Function to calculate TOTAL distance:
export function getTotalDistance(activities) {
  return activities.reduce((total, activity) => total + activity.distance, 0);
}

// Function to generate access token, fetch the data, parse it, and update the database:
export async function loadUserData() {
  console.log(
    "➡️ loadUserData for hardcoded user " +
      JSON.stringify({ userName }) +
      " awaits stravaUserInfo>newAccessToken."
  );

  await newAccessToken(); // Wait for the new access token to be fetched
  console.log("➡️ newAccessToken is generating the API link.");

  const dataLink = `https://www.strava.com/api/v3/athlete/activities?access_token=${accessToken}`;

  console.log("➡️ Sending FETCH request to the API link.");
  return (
    fetch(dataLink)
      .then((res) => res.json())
      .then((activities) => {
        console.log("➡️ FETCH JSON Strava data success, now parsing.");
        // console.log(activities)

        const totalDistanceThisWeek = Math.round(
          getTotalDistanceThisWeek(activities)
        );
        const totalDistanceToday = Math.round(
          getTotalDistanceToday(activities)
        );
        const totalDistance = Math.round(getTotalDistance(activities));
        const baseUrl = process.env.BASE_URL || "http://localhost:3000";
        // App home page - Had to be set because this is running server side instead of client side now.

        // Update total_distance_today in the database
        console.log("➡️ Updating database for Strava user only.");

        return fetch(`${baseUrl}/api/updateDistance`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ userName, distance: totalDistanceToday }),
        })
          .then((res) => res.json())
          .then((data) => {
            // Update total_distance and gold in the database
            return fetch(`${baseUrl}/api/updateTotalDistance`, {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
              },
              body: JSON.stringify({ userName, totalDistance }),
            });
          })

          .then((res) => res.json())
          .then((data) => {
            return { totalDistanceThisWeek, totalDistanceToday, totalDistance };
          })

          .catch((error) => {
            console.error("⛔ Error updating total distance:", error);
            return { totalDistanceThisWeek, totalDistanceToday, totalDistance };
          });
      })

      // If any error, set them to 0.
      .catch((error) => {
        console.error("⛔ Error fetching data:", error);
        return {
          totalDistanceThisWeek: 0,
          totalDistanceToday: 0,
          totalDistance: 0,
        };
      })
  );
}
