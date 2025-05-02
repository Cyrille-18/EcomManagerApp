class Order {
  final String firstName;
  final String lastName;
  final String orderNumber;
  final DateTime dateTime;
  final String address;
  final String amount;
  final String status; // "Nouveau", "En cours", "Terminé"
  final String product;
  final int quantity;
  final String phoneNumber;

  Order({
    required this.firstName,
    required this.lastName,
    required this.orderNumber,
    required this.dateTime,
    required this.address,
    required this.amount,
    required this.status,
    required this.product,
    required this.quantity,
    required this.phoneNumber,
  });
}
