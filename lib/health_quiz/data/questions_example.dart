import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
      " ______________________ is a disorder or bad functioning (malfunction of mind or body) which leads to departure of good health?",
      {
        "Disease": true,
        "Physical disease ": false,
        "Health": false,
        "Infectious disease": false,
      }),
  QuestionModel(
      "Which exercise boosts metabolism 24 hours a day, seven days a week?", {
    "Strength training": true,
    "Pilates": false,
    "Yoga": false,
    "Kickboxing ": false,
  }),
  QuestionModel(
      "This exercise tool uses your own body weight to loosen tight muscles and improve blood flow?",
      {
        "Stability ball": false,
        "Resistance band": false,
        "Foam roller": true,
        "Exercise mat": false,
      }),
  QuestionModel(
      "Yoga poses designed to stretch and strengthen your body are called?", {
    "Stretches": false,
    "Asanas": true,
    "Chakras": false,
    "Pranas": false,
  }),
  QuestionModel("Which woman was the first to star in an exercise program?", {
    "Jillian Michaels": false,
    "Debbie Drake": true,
    "Suzanne Somers": false,
    "Jane Fonda": false,
  }),
  QuestionModel("What is the best way to rehydrate after exercise?", {
    "Eat fruit": false,
    "Drink water": true,
    "Drinks sports drinks": false,
    "Drink fruit juice": false,
  }),
  QuestionModel(
      "How much high-intensity exercise should adults strive for each week?", {
    "30 minutes a week": false,
    "120 minutes a week": false,
    "140 minutes a week": false,
    "75 minutes a week": true,
  }),
  QuestionModel(
      "Walking just 2.5 hours a week can decrease your risk of developing this condition by as much as 60 percent?",
      {
        "Arthritis": false,
        "Heart disease": false,
        "Diabetes": true,
        "Emphysema": false,
      }),
  QuestionModel(
      "Having a strong core — the muscles in your torso and pelvis — can help you to avoid:",
      {
        "The flu": false,
        "Falls": true,
        "Stress fractures": false,
        "Tennis elbow": false,
      }),
  QuestionModel(
    "The term ‘health’ is defined in many ways. The most accurate definition of the health would be?",
    {
      "Health is the state of body and mind in a balanced condition": false,
      "Health is the reflection of a smiling face ": false,
      "Health is a state of complete physical, mental and social well-being ":
          true,
      "Health is the symbol of economic prosperity": false,
    },
  ),
  QuestionModel("When can we say that we are not healthy?", {
    "When we are able to cope well with the social pressure": false,
    "When we have a positive outlook towards life": false,
    "When we feel good physically ": true,
    "When we constantly suffer from headaches due to a stressful life": false,
  }),
];
