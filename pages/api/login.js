import { runTestPageLogic } from "./newStravaLogic";
console.log(
  "01➡️ LOGIN CLICKED > pages>api>login.js called by Login.jsx handleLogin onClick"
);
console.log("02➡️ Chosen username set as sessionToken.");
export default async function login(req, res) {
  const { username } = req.body;

  const sessionToken = `${username}`;
  res.setHeader("Set-Cookie", `session=${sessionToken}; Path=/; HttpOnly`);

  console.log(
    "03➡️ Call runTestPageLogic to load Strava data / update Database no matter who logged in, then proceed to home page."
  );

  await runTestPageLogic();
  // Run newStravaLogic on login button click

  res.status(200).json({ message: "Login successful!" });
}
