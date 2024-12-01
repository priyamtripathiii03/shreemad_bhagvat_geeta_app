import 'package:flutter/material.dart';
import 'package:shreemad_bhagvat_geeta_app/modal/gita_modal.dart';

List<PopupMenuEntry> popUpMenuItems = [
  const PopupMenuItem(
    value: 0,
    child: Text(
      'Sanskrit',
    ),
  ),
  const PopupMenuItem(
    value: 1,
    child: Text(
      'Hindi',
    ),
  ),
  const PopupMenuItem(
    value: 2,
    child: Text(
      'English',
    ),
  ),
  const PopupMenuItem(
    value: 3,
    child: Text(
      'Gujarati',
    ),
  ),
];
List<Verses> shloks = [];
List<Verses> shlokPreviewList = [];

String om='ऊँ श्री परमात्मने नमः';