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
  tour(
    icon: Icon(Icons.tour_outlined),
    label: 'Tourism',
  );

  const BottomNavBarUtil({
    required this.icon,
    required this.label,
  });

  final Icon icon;
  final String label;
}
