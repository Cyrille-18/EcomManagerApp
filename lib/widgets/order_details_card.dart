import 'package:flutter/material.dart';
import '../../models/order.dart';

class OrderDetailsCard extends StatelessWidget {
  final Order order;

  const OrderDetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Détails",
                style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 8),

            // Produit commandé
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.local_florist_outlined),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.product),
                        Text("Quantité : ${order.quantity}"),
                      ],
                    ),
                  ],
                ),
                Text(order.amount),
              ],
            ),

            const Divider(height: 24),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                // On reprend le montant total (déjà dans order.amount ici)
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(order.amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ),

            const SizedBox(height: 12),

            // Moyen de paiement (statique ici, à adapter si besoin)
            Row(
              children: const [
                Icon(Icons.monetization_on_outlined, size: 20),
                SizedBox(width: 8),
                Text("Payé à la livraison",
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
