import 'package:flutter/material.dart';
import 'package:maplenou/data/sample_orders.dart';
import 'package:maplenou/models/order.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';
import 'package:maplenou/widgets/MyAppbar.dart';
import 'package:maplenou/widgets/order_card.dart';
import 'package:maplenou/widgets/searchbar.dart';
import 'package:maplenou/widgets/statut_tabs.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedTab = 0;
  final searchController = TextEditingController();
  int _selectedIndex = 1; // Index de l'onglet sélectionné

  @override
  Widget build(BuildContext context) {
    List<Order> filteredOrders = sampleOrders
        .where((o) =>
            o.status == ["Nouveau", "En cours", "Terminé"][selectedTab] &&
            ("${o.firstName} ${o.lastName}"
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) ||
                o.orderNumber
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase())))
        .toList();

    List<int> counts = [
      sampleOrders.where((o) => o.status == "Nouveau").length,
      sampleOrders.where((o) => o.status == "En cours").length,
      sampleOrders.where((o) => o.status == "Terminé").length,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: MyAppBar(
        title: "Commandes",
        centerTitle: false,
      ),
      body: Column(
        children: [
          SearchBarWidget(
              controller: searchController, onChanged: (_) => setState(() {})),
          StatusTabs(
              selectedIndex: selectedTab,
              onTap: (i) => setState(() => selectedTab = i),
              counts: counts),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) =>
                  OrderCard(order: filteredOrders[index]),
            ),
          )
        ],
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}
