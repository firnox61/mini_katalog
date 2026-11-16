import 'package:flutter/material.dart';

import '../models/product.dart';

class CartPage extends StatelessWidget {
  final List<Product> items;

  const CartPage({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final total = items.fold<double>(
      0,
      (sum, product) => sum + product.price,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'Sepetinde henüz ürün yok.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final product = items[index];

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 4,
                        ),
                        leading: CircleAvatar(
                          child: Text(product.icon),
                        ),
                        title: Text(product.name),
                        subtitle: Text(product.category),
                        trailing: Text(
                          '${product.price.toStringAsFixed(2)} ₺',
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Toplam',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${total.toStringAsFixed(2)} ₺',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}