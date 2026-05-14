import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onFavoriteToggle,
  });

  static const routeName = '/detail';

  final Product product;
  final ValueChanged<int> onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geri'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.network(
                      product.imageUrl,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF35212F),
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.category,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF9A83AE),
                        ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '${product.price.toStringAsFixed(2)} TL',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color(0xFFB04E8A),
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Aciklama',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF35212F),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                height: 1.5,
                                color: const Color(0xFF675866),
                              ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Ozellikler',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF35212F),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _InfoChip(
                              label: 'Tur',
                              value: product.category,
                            ),
                            const SizedBox(width: 8),
                            _InfoChip(
                              label: 'Fiyat',
                              value: '${product.price.toStringAsFixed(0)} TL',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  onFavoriteToggle(product.id);
                  Navigator.pop(context);
                },
                icon: Icon(
                  product.isFavorite
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                ),
                label: Text(
                  product.isFavorite ? 'Sepetten Cikar' : 'Sepete Ekle',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF5FA),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF9F8F9D),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF35212F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
