const stripe = require("stripe")(process.env.STRIPE_SECRET_KEY);

export default async function handler(req, res) {
  if (req.method === "POST") {
    try {
      // Create a checkout session
      const session = await stripe.checkout.sessions.create({
        line_items: [
          {
            price_data: {
              currency: "cad",
              product_data: {
                name: "1000 Gold",
              },
              unit_amount: 500,
            },
            quantity: 1,
          },
        ],
        mode: "payment",
        ui_mode: "embedded",
        return_url: "http://localhost:3000/stripe-redirect",
      });

      res.status(200).json({ clientSecret: session.client_secret });
    } catch (error) {
      console.error("Error creating checkout session:", error);
      res.status(500).json({ error: "Failed to create checkout session" });
    }
  } else {
    res.setHeader("Allow", ["POST"]);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}
