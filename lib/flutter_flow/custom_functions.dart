import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

int getScore(
  dynamic map,
  String? person,
) {
  return map[person];
}

bool isFinished(
  dynamic finish,
  String person,
) {
  return finish[person] != 1;
}

bool? eventByUser(
  String? userID,
  String? eventUserID,
) {
  return userID == eventUserID;
}

bool? canStart(
  String? status,
  int? numItems,
) {
  return status != 'Done' && numItems! > 0;
}
