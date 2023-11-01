import 'package:flutter/material.dart';

enum InitData {
  login(
    icon: Icons.login_outlined,
    name: 'Login to iDukaan',
  ),
  signUp(
    icon: Icons.person_add_alt,
    name: 'Continue Signup',
  ),
  skip(
    icon: Icons.skip_next_outlined,
    name: 'Continue Travelling',
  );

  const InitData({
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;
}
