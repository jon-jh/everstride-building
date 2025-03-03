import { newStravaLogic } from "./newStravaLogic";
console.log("➡️ LOGIN CLICKED [login.js called by Login.jsx]");

export default async function login(req, res) {
  const { username } = req.body;

  const sessionToken = `${username}`;
  res.setHeader("Set-Cookie", `session=${sessionToken}; Path=/; HttpOnly`);

  console.log(
    "➡️ Login.js calls newStravaLogic [always loads Jon Strava data, update DB]"
  );

  await newStravaLogic();
  // Run newStravaLogic on login button click

  res.status(200).json({ message: "Login successful!" });
}
