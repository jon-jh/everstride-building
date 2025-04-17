import { newStravaLogic } from "./newStravaLogic";
// console.log("Login onClick [login.js called by Login.jsx]");

export default async function login(req, res) {
  const { username } = req.body;

  const sessionToken = `${username}`;
  res.setHeader("Set-Cookie", `session=${sessionToken}; Path=/; HttpOnly`);

  console.log("🟠 username cookie is now set.");
  // console.log("login.js called newStravaLogic [fetch API data]");

  await newStravaLogic();
  // Run newStravaLogic on login button click
    res.status(200).json({ message: "Login successful!" });
}
