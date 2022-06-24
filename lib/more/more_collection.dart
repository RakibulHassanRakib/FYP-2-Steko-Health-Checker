import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:steko_health_checker/more/more.dart';

class MoreCollection {
  final List<More> _more = [
    More(
      id: 'count_heart_rate',
      color: const Color(0xFFFFDADA),
      title: 'Count Heart Rate',
      image: Image.asset('assets/images/love.png'),
    ),
    More(
      id: 'track_blood_sugar',
      color: const Color(0xFFD8DEFF),
      title: 'Track Blood Sugar',
      image: Image.asset('assets/images/blood_sugar.png'),
    ),
    More(
      id: 'track_blood_pressure',
      color: const Color(0xFFD8DEFF),
      title: 'Track Blood Pressure',
      image: Image.asset('assets/images/blood-pressure.png'),
    ),
    More(
      id: 'count_calories_intake',
      color: const Color(0xFFD1E6FC),
      title: 'Count Calories Intake',
      image: Image.asset('assets/images/calories_intake.png'),
    ),
    More(
      id: 'calculate_bmi',
      color: const Color(0xFFFFD98A),
      title: 'Calculate BMI',
      image: Image.asset('assets/images/bmi.png'),
    ),
    More(
      id: 'fitness_quiz',
      color: const Color(0xFFCAD3F8),
      title: 'Fitness Quiz',
      image: Image.asset('assets/images/quiz.png'),
    ),
    More(
      id: 'sleep_tracker',
      color: const Color(0xFFD7FFD4),
      title: 'Track Sleep',
      image: Image.asset('assets/images/sleep.png'),
    ),
    More(
      id: 'tips_tricks',
      color: const Color(0xFF111111).withOpacity(0.47),
      title: 'Tips & Tricks',
      image: Image.asset('assets/images/tips.png'),
    ),
  ];

  UnmodifiableListView<More> get more => UnmodifiableListView(_more);
}
