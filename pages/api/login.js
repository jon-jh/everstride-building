export default async function login(req, res) {
  const { username } = req.body;

  const sessionToken = `${username}`;
  res.setHeader("Set-Cookie", `session=${sessionToken}; Path=/; HttpOnly`);

  console.log("🟠 username cookie is now set.");

  res.status(200).json({ message: "Login successful!" });
}
