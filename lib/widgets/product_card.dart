import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavoritePressed,
  });

  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: onFavoritePressed,
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.92),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              product.isFavorite
                                  ? Icons.shopping_cart
                                  : Icons.add_shopping_cart,
                              size: 18,
                              color: const Color(0xFFB04E8A),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF35212F),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                product.category,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8E5CC7),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${product.price.toStringAsFixed(2)} TL',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB04E8A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
