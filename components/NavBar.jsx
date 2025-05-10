import "./NavBar.css";
import NavLinks from "./NavLinks";
import Link from "next/link";
import Login from "./Login";
import Logout from "./Logout";

const NavBar = ({
  userItems,
  cookieSession,
  userEquipment,
  user,
  showLogin = false,
  allItems,
}) => {
  return (
    <div className="NavBar">
      
      {/* Logo Section */}
      <div className="NavBar-item Logo-box">
          <Link href="/" className="Logo-small">
            <p>ES</p>
          </Link>
        <Link href="/" className="Logo">
          <p>Everstride</p>
          <p style={{ color: "darkslategrey" }}>2</p>
        </Link>
      </div>

      {/* Navigation Links */}
      {cookieSession ? (
        <div className="NavBar-item NavLinks">
          <NavLinks
            userItems={userItems}
            userEquipment={userEquipment}
            user={user}
            allItems={allItems}
          />
        </div>
      ) : (
        showLogin && (
          <div className="NavBar-item LoginContainer">
            <Login />
          </div>
        )
      )}

      {/* Logout Section */}
      {cookieSession && (
        <div className="NavBar-item UserLogOutContainer">
          <div className="desktop-username">{cookieSession}</div>
          <Logout />
        </div>
      )}
    </div>
  );
};

export default NavBar;
