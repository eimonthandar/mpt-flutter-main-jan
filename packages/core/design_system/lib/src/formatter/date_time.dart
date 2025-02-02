import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {

  String asString(BuildContext context) {
    return asShortDate(context);
  }

  String asShortDate(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatShortDate(this);
  }

  String asMediumDate(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatMediumDate(this);
  }

  String asShortMonthDay(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatShortMonthDay(this);
  }

  String asTimeOfDay(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(TimeOfDay.fromDateTime(toLocal()));
  }

  // format date and time
  String asDateTime(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return '${asShortDate(context)} ${asTimeOfDay(context)}';
  }

  bool isToday() {
    final currentDateTime = DateTime.now();
    final currentDate = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);
    DateTime inputDate = DateTime(year, month, day);
    return inputDate.isAtSameMomentAs(currentDate);
  }

  bool isYesterday() {
    DateTime currentDateTime = DateTime.now();
    DateTime currentDate = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);
    DateTime inputDate = DateTime(year, month, day);
    DateTime yesterday = currentDate.subtract(const Duration(days: 1));
    return inputDate.isAtSameMomentAs(yesterday);
  }
}
