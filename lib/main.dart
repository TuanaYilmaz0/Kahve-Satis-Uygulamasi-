import 'package:flutter/material.dart';

import 'data/product_repository.dart';
import 'models/product.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final products = await ProductRepository.loadProducts();
  runApp(MyApp(products: products));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.products});

  final List<Product> products;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final List<Product> _products;

  @override
  void initState() {
    super.initState();
    _products = widget.products;
  }

  void _toggleFavorite(int productId) {
    final index = _products.indexWhere((product) => product.id == productId);
    if (index == -1) {
      return;
    }

    setState(() {
      _products[index] = _products[index].copyWith(
        isFavorite: !_products[index].isFavorite,
      );
    });
  }

  List<Product> get _cartProducts =>
      _products.where((product) => product.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Coffee Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB04E8A),
          primary: const Color(0xFFB04E8A),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF7FB),
          foregroundColor: Color(0xFF5B2A4A),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              products: _products,
              onFavoriteToggle: _toggleFavorite,
              cartCount: _cartProducts.length,
            ),
        CartScreen.routeName: (context) => CartScreen(
              cartProducts: _cartProducts,
              onFavoriteToggle: _toggleFavorite,
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(
              product: product,
              onFavoriteToggle: _toggleFavorite,
            ),
          );
        }
        return null;
      },
    );
  }
}
