import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.products,
    required this.onFavoriteToggle,
    required this.cartCount,
  });

  final List<Product> products;
  final ValueChanged<int> onFavoriteToggle;
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kesfet'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB04E8A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        cartCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bir sonraki favori kahveni bul.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF90808E),
                  ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFFC0B3BF),
                  ),
                  hintText: 'Kahve ara',
                  hintStyle: TextStyle(
                    color: Color(0xFFC0B3BF),
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFE2F0),
                    Color(0xFFE7D8FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Coffee Shop\'a\nHos Geldin',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF412338),
                                    height: 1.2,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tatli renkler ve sade bir kahve deneyimi seni bekliyor.',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: const Color(0xFF7C6577),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.local_cafe,
                      size: 34,
                      color: Color(0xFFB04E8A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Populer Kahveler',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF35212F),
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Bir kahve sec, detaylarini incele ve sepetine ekle.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF90808E),
                  ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.76,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProductDetailScreen.routeName,
                        arguments: product,
                      );
                    },
                    onFavoritePressed: () => onFavoriteToggle(product.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
