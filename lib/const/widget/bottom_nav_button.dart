import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    {required IconData icon, required String name, required bool isSelected}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: name,
  );
}