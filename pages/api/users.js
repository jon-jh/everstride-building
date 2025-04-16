import { fetchUserAndFriends } from "@/app/helpers/userHelpers";
import { fetchEquippedHat, fetchEquippedShirt, fetchEquippedPants, fetchEquippedBoots, fetchEquippedWeapon } from "@/app/helpers/equippedItemHelpers";

async function fetchEquipmentForUser(userId) {
  const [hat, shirt, pants, boots, weapon] = await Promise.all([
    fetchEquippedHat(userId),
    fetchEquippedShirt(userId),
    fetchEquippedPants(userId),
    fetchEquippedBoots(userId),
    fetchEquippedWeapon(userId),
  ]);
  
  return { hat, shirt, pants, boots, weapon };
}