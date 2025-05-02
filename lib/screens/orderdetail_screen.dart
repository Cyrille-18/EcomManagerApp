import 'package:flutter/material.dart';
import 'package:maplenou/widgets/client_info_card.dart';
import 'package:maplenou/models/order.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';
import 'package:maplenou/widgets/MyAppbar.dart';
import 'package:maplenou/widgets/delivery_card.dart';
import 'package:maplenou/widgets/order_details_card.dart';
import 'package:maplenou/widgets/order_statut_card.dart';

class OrderdetailScreen extends StatefulWidget {
  final Order order;
  const OrderdetailScreen({super.key, required this.order});

  @override
  State<OrderdetailScreen> createState() => _OrderdetailScreenState();
}

class _OrderdetailScreenState extends State<OrderdetailScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: MyAppBar(
        title: "Détails de la commande",
        centerTitle: false,
        leadingIcon: Icons.arrow_back,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            OrderStatusCard(order: widget.order),
            const SizedBox(height: 10),
            ClientInfoCard(order: widget.order),
            const SizedBox(height: 10),
            OrderDetailsCard(order: widget.order),
            const SizedBox(height: 10),
            DeliveryCard(order: widget.order),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}
