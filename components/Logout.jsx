"use client";
import "./Logout.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faRightFromBracket } from "@fortawesome/free-solid-svg-icons";
import Link from "next/link";

const Logout = () => {
  const handleLogout = async () => {
    await fetch("api/logout", {
      method: "POST",
    });

    window.location.reload();
  };

  return (
    <div className="Logout">
      {/* Desktop Button */}
      <Link href="" className="Logout-desktop">
        <button onClick={handleLogout}>Change Player</button>
      </Link>
      {/* Mobile Button */}
      <Link href="" className="Logout-mobile">
        <button onClick={handleLogout}>
          <p className="a">
            <FontAwesomeIcon icon={faRightFromBracket} />
          </p>
        </button>
      </Link>
    </div>
  );
};

export default Logout;
