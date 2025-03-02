require("dotenv").config();

// This is just hardcoded for now
export const userName = "Jon Hiebert";

export let accessToken = "";

export async function newAccessToken() {
  console.log("🟢➡️ newAccessToken sent a FETCH request using the .env file keys to get access to the Strava User's Data");
  try {
    const response = await fetch("https://www.strava.com/oauth/token", {
      method: "post",
      headers: {
        Accept: "application/json, text/plain, */*",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        client_id: process.env.NEXT_PUBLIC_CLIENT_ID,
        client_secret: process.env.NEXT_PUBLIC_CLIENT_SECRET,
        refresh_token: process.env.NEXT_PUBLIC_REFRESH_TOKEN,
        grant_type: "refresh_token",
      }),
    });
    const data = await response.json();
    accessToken = data.access_token;
  } catch (error) {
    console.error("Error fetching new access token:", error);
  }
}
