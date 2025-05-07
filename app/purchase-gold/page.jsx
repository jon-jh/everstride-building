"use client";

import Footer from "@/components/Footer";
import "app/purchase-gold/page.css";
import { useCallback } from "react";
import { loadStripe } from "@stripe/stripe-js";
import {
  EmbeddedCheckoutProvider,
  EmbeddedCheckout,
} from "@stripe/react-stripe-js";

// Make sure to call `loadStripe` outside of a component’s render to avoid
// recreating the `Stripe` object on every render.
const stripePromise = loadStripe(
  process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
);

const PurchaseGold = () => {
  const fetchClientSecret = useCallback(() => {
    // Create a Checkout Session
    return fetch("/api/create-checkout-session", {
      method: "POST",
    })
      .then((res) => res.json())
      .then((data) => data.clientSecret);
  }, []);

  const options = { fetchClientSecret };

  return (
    <div>
      <div className="NavBar">
        <h1 className="NavBar-logo">
          <a href="/">Everstride</a>
        </h1>
      </div>
      <div className="checkout">
        <EmbeddedCheckoutProvider stripe={stripePromise} options={options}>
          <EmbeddedCheckout />
        </EmbeddedCheckoutProvider>
      </div>
      <div className="Footer">
        <h4>Stripe API Integration Demo</h4>
        <p>Simulation Card Number: 4242 4242 4242 4242</p>
        <p>Any Future Date, Any 3 Digits</p>
      </div>
    </div>
  );
};

export default PurchaseGold;
