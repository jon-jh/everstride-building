"use client";
import { useCallback } from "react";
import NavBar from "@/components/NavBar";
import "@/components/NavBar.css";
import "./page.css";
import {
  EmbeddedCheckoutProvider,
  EmbeddedCheckout,
} from "@stripe/react-stripe-js";

import { loadStripe } from "@stripe/stripe-js";
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
      <NavBar />
      <div className="checkout">
        <EmbeddedCheckoutProvider stripe={stripePromise} options={options}>
          <EmbeddedCheckout />
        </EmbeddedCheckoutProvider>
      </div>
      <div className="StripeDemoInfo">
        <h4>Stripe API Integration Demo</h4>
        <p>Simulation Card: 4242 4242 4242 4242</p>
        <p>Any Future Date, Any 3 Digits</p>
      </div>
    </div>
  );
};
export default PurchaseGold;
