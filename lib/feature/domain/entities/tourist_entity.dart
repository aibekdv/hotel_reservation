import 'package:flutter/material.dart';

class TouristEntity {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController birthDay;
  final TextEditingController citizenship;
  final TextEditingController passportNumber;
  final TextEditingController passportValidityPeriod;

  TouristEntity({
    required this.firstName,
    required this.lastName,
    required this.birthDay,
    required this.citizenship,
    required this.passportNumber,
    required this.passportValidityPeriod,
  });
}
