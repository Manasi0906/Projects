import 'package:flutter/material.dart';

class DayAvailability {
  String day;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isDayOff;

  DayAvailability({
    required this.day,
    this.startTime,
    this.endTime,
    this.isDayOff = false,
  });
}
