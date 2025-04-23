import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  final int currentIndex;

  const Bottomnavbar({
    super.key,
    required this.currentIndex,
  });

  void _navigate(BuildContext context, int index) {
    if (index == 3) {
      _showMoreOptions(context);
    } else {
      String route = switch (index) {
        0 => '/acceuil',
        1 => '/commande',
        2 => '/produit',
        _ => '/acceuil', //default
      };
      Navigator.pushReplacementNamed(context, route);
    }
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withOpacity(0.2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading:
                    const Icon(Icons.dashboard_outlined, color: Colors.black),
                title: const Text('Catégories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.view_list_outlined, color: Colors.black),
                title: const Text('Sous-catégories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/sous-categories');
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.settings_outlined, color: Colors.black),
                title: const Text('Paramètres'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Déconnexion',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  Navigator.pop(context);
                  //Deconnexion
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _navigate(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.shade600,
      elevation: 20,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          activeIcon: Icon(Icons.receipt_long),
          label: 'Commande',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront_outlined),
          activeIcon: Icon(Icons.storefront),
          label: 'Produit',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          activeIcon: Icon(Icons.more_horiz),
          label: 'Plus',
        ),
      ],
    );
  }
}
