import 'package:flutter/material.dart';
import 'package:maplenou/widgets/BottomNavbar.dart';
import 'package:maplenou/widgets/MyAppbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedDashboard = 0;

  final List<String> dashboardOptions = [
    'Tout',
    'CA',
    'Produits',
    'Clients',
    'Bénefices',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: const Myappbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 34, // hauteur fixée pour les chips
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: dashboardOptions.length,
                padding: const EdgeInsets.only(right: 12),
                separatorBuilder: (_, __) => const SizedBox(width: 6),
                itemBuilder: (context, index) {
                  final isSelected = _selectedDashboard == index;
                  return ChoiceChip(
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    label: Text(
                      dashboardOptions[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        _selectedDashboard = index;
                      });
                    },
                    selectedColor: Colors.black,
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    showCheckmark: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Text(
                  'Bienvenue sur Maplenou',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(currentIndex: _selectedIndex),
    );
  }
}
