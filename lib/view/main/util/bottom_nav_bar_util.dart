import 'package:flutter/material.dart';

enum BottomNavBarUtil {
  dashboard(
    icon: Icon(Icons.dashboard_outlined),
    label: 'Dashboard',
  ),
  train(
    icon: Icon(Icons.train_outlined),
    label: 'Train',
  ),
  wallet(
    icon: Icon(Icons.wallet_travel),
    label: 'Wallet',
  ),
  help(
    icon: Icon(Icons.help_outline),
    label: 'Help',
  );

  const BottomNavBarUtil({
    required this.icon,
    required this.label,
  });

  final Icon icon;
  final String label;
}
