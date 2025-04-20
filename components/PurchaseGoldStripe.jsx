import "./PurchaseGoldStripe.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCartShopping } from "@fortawesome/free-solid-svg-icons";

const PurchaseGoldStripe = () => {
  return (
    <div className="PurchaseGoldStripe">
      <div className="PurchaseGoldStripe-ad">
        <h3>Purchase 1000💰 for only five dollars!</h3>
      </div>
      <a href="/purchase-gold" className="PurchaseGoldStripe-link">
        <button className="PurchaseGoldStripe-button">
          <FontAwesomeIcon icon={faCartShopping} size="2x" />
          <h2 className="Stripe-button">Buy - Demo Mode</h2>
        </button>
      </a>
    </div>
  );
};

export default PurchaseGoldStripe;
