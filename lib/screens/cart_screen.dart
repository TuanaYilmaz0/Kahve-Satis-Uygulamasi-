import 'package:flutter/material.dart';

import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
    required this.cartProducts,
    required this.onFavoriteToggle,
  });

  static const routeName = '/cart';

  final List<Product> cartProducts;
  final ValueChanged<int> onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            Expanded(
              child: cartProducts.isEmpty
                  ? const _EmptyCartView()
                  : ListView.separated(
                      itemCount: cartProducts.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final product = cartProducts[index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 14,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.network(
                                  product.imageUrl,
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF35212F),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product.category,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF9A83AE),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '${product.price.toStringAsFixed(2)} TL',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFB04E8A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => onFavoriteToggle(product.id),
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Color(0xFFB04E8A),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 18,
                    color: Color(0xFFB8A7B6),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      cartProducts.isEmpty
                          ? 'Sepet bos, eklemek icin urun sec.'
                          : 'Siparis oncesi urunlerini kontrol et.',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9F8F9D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
                child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: const Text('Siparisi Tamamla'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyCartView extends StatelessWidget {
  const _EmptyCartView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              Icons.shopping_cart_checkout_outlined,
              size: 40,
              color: Color(0xFFB8A7B6),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Sepetin bos',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF35212F),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Alisverise baslamak icin urun ekle',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFFB4A4B1),
            ),
          ),
        ],
      ),
    );
  }
}
