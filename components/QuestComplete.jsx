"use client";

import { useState } from "react";
import "./QuestComplete.css";

const QuestComplete = ({ currentQuest }) => {
  const [resultsScreen, setResultsScreen] = useState({
    message: null,
    gold: null,
  });

  // Unpack quest object...
  const {
    option_1,
    option_2,
    result_description,
    success_message,
    failure_message,
  } = currentQuest;

  const userQuestId = currentQuest.user_quests_id;
  const questId = currentQuest.quest_id;
  const userId = currentQuest.user_id;

  // Random Gold Reward
  let updatedUserGold = currentQuest.user_gold;
  const min = questId * (Math.random() < 0.5 ? 200 : 270);
  const max = min + (Math.random() < 0.5 ? 1500 : 3100);
  const randomGoldReward = Math.floor(Math.random() * (max - min + 1) + min);

  // New dice roll which removes the 'odds' dependancy from the database. Much easier to maintain / adjust.

  const determineOutcome = () => {
    const randomChance = Math.random();
    return randomChance < 0.7; // 70% chance to return true, 30% chance to return false
  };

  async function completeCurrentQuest(
    userQuestId,
    userId,
    updatedUserGold
  ) {

    const outcome = determineOutcome;

    if (outcome) {
      updatedUserGold += randomGoldReward;
    }

    const response = await fetch("/api/completeQuest", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ userQuestId, userId, updatedUserGold, questId }),
    });

    const result = await response.json();
    if (result.success) {
      // Show the outcome of your choice...
      if (outcome) {
        setResultsScreen((prevState) => ({
          ...prevState,
          message: success_message,
          gold: randomGoldReward,
        }));
      } else {
        setResultsScreen((prevState) => ({
          ...prevState,
          message: failure_message,
        }));
      }

      // Reload the page after 5 seconds...
      setTimeout(() => {
        window.location.reload();
      }, 5000);
    } else {
      console.error(result.message);
    }
  }

  return (
    <div>
      {/* Display choices after quest is completed / Display results after option is selected */}
      {!resultsScreen.message ? (
        <div className="QuestComplete-choice">
          <b className="QuestComplete-congrats">Quest Completed!</b>
          <i className="QuestComplete-description">{result_description}</i>
          <div className="QuestComplete-buttons">
            <button
              className="QuestComplete-button"
              onClick={() =>
                completeCurrentQuest(
                  userQuestId,
                  userId,
                  updatedUserGold
                )
              }
            >
              {option_1}
            </button>
            <button
              className="QuestComplete-button"
              onClick={() =>
                completeCurrentQuest(
                  userQuestId,
                  userId,
                  updatedUserGold
                )
              }
            >
              {option_2}
            </button>
          </div>
        </div>
      ) : (
        <div className="QuestComplete-choice">
          <b className="QuestComplete-congrats">{resultsScreen.message}</b>
          <b className="QuestComplete-result">
            {resultsScreen.gold && `You receive 💰${resultsScreen.gold} gold!!`}
          </b>
          <i>Starting new quest in 5 seconds...</i>
        </div>
      )}
    </div>
  );
};

export default QuestComplete;
