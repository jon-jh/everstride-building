# Everstride - A Fitness RPG

### Check out the dev build here: [https://everstride.vercel.app/](https://everstride.vercel.app/)

Everstride is a gamified fitness app built with Next.js, where users complete DnD-inspired quests by reaching step goals. Progress earns gold to upgrade avatars with new gear, while social features let friends track each other’s journeys. Users can also purchase gold securely via Stripe integration for faster upgrades.

## Features

- **Quest-based Progression:** Users are always on a quest, where they progress based on daily and weekly step goals.
- **StepVisualizer:** At the center of the app is the StepVisualizer, which translates daily step counts into the avatar's position on the X-axis. The goal is to reach the star at the end of the quest.
- **Avatar Customization:** Personalize your adventure by editing your avatar through the Avatar Editor.
- **Gamified Decisions:** After completing a quest, users face random D&D-style events with interactive choices. Rolling a dice may reward users with gold.
- **Social Connectivity:** Add friends to see their progress, maintain motivation, and foster friendly competition.
- **Gold Economy:** Earn gold from quests and spend it in the Gold Market to unlock new equipment.
- **Payment Integration:** Use Stripe to purchase gold directly with secure payments.

## Final Product

_Customize your avatar to stand out from your friends!_
!["Avatar editor menu"](https://raw.githubusercontent.com/kylemcparland/everstride/refs/heads/main/media/2E-avatar.png "Avatar editor menu")

_Completing a quest leads to a choice - and the roll of a dice! Make your choice wisely!_
!["Completing a quest"](https://raw.githubusercontent.com/kylemcparland/everstride/refs/heads/main/media/3E-complete-quest.gif "Completing a quest")

_The world map shows your meta-progression across all quests. Progress on the world map to update your StepVisualizer's backdrop!_
!["World map display"](https://raw.githubusercontent.com/kylemcparland/everstride/refs/heads/main/media/4E-map.png "World map display")

_Add friends to motivate each other to reach your goals. No scrolling required - the page will change dynamically!_
!["Adding a friend"](https://raw.githubusercontent.com/kylemcparland/everstride/refs/heads/main/media/5E-add-friend.gif "Adding a friend")

_Purchase new equipment using gold earned from quests!_
!["Store menu"](https://raw.githubusercontent.com/kylemcparland/everstride/refs/heads/main/media/6E-store.png "Store menu")

_Or make a secure payment with Stripe to earn gold the old fashioned way!_
!["Using the Stripe API"](https://raw.githubusercontent.com/kylemcparland/everstride/refs/heads/main/media/7E-stripe.png "Using the Stripe API")

## Dependencies

### Development:

- Next.js ^13.5.7
- React ^18.2.0
- Stripe ^17.5.0
- React-Stripe--js ^3.1.1
- Stripe-js ^5.4.0
- PostgreSQL ^14.x

## Bugs and Issues

If you encounter any bugs or have suggestions for improvement, please feel free to open an issue on [GitHub](https://github.com/kylemcparland/everstride/issues).

---

#### Thank you for checking out Everstride!
