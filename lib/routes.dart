import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/orders_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomeScreen(),
  '/orders': (context) => const OrdersScreen(),
};
