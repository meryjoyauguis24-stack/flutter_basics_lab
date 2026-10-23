import 'package:flutter/material.dart';

import 'student.dart';

void main() => runApp(const CafeApp());

class CafeItem {
  const CafeItem(this.name, this.price, this.icon, {this.bestSeller = false});

  final String name;
  final double price;
  final IconData icon;
  final bool bestSeller;
}

const List<CafeItem> menu = [
  CafeItem('Iced Coffee', 85, Icons.local_cafe, bestSeller: true),
  CafeItem('Hot Chocolate', 75, Icons.coffee),
  CafeItem('Fruit Shake', 90, Icons.local_drink, bestSeller: true),
  CafeItem('Cheeseburger', 120, Icons.lunch_dining),
  CafeItem('Fries', 60, Icons.fastfood),
  CafeItem('Ensaymada', 45, Icons.bakery_dining),
  CafeItem('Ice Cream', 50, Icons.icecream),
  CafeItem('Chocolate Cake', 65, Icons.cake, bestSeller: true),
];

const List<String> categories = [
  'All',
  'Drinks',
  'Snacks',
  'Meals',
  'Desserts',
];

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: studentColor,
        scaffoldBackgroundColor: const Color(0xFFF6EFE7),
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // Coffee shop palette
  static const Color _espresso = Color(0xFF4B2E2B);
  static const Color _latte = Color(0xFFC8A27C);
  static const Color _caramel = Color(0xFFD9A066);
  static const Color _cream = Color(0xFFF6EFE7);
  static const Color _mocha = Color(0xFF6F4E37);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4 - $studentName'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: _espresso,
      ),
      body: Column(
        children: [
          // Hero banner with warm coffee gradient
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_mocha, _espresso],
                ),
                boxShadow: [
                  BoxShadow(
                    color: _espresso.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -10,
                    bottom: -24,
                    child: Icon(
                      Icons.local_cafe,
                      size: 170,
                      color: Colors.white.withOpacity(0.10),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    bottom: 22,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Campus Café',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            color: Color(0xFFFFF3E6),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Freshly brewed · Made with love',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFE8CDB3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7BA05B),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Text(
                        'OPEN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Category chips
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: categories.length,
              separatorBuilder: (_, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: index == 0 ? _espresso : _cream,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: index == 0 ? _espresso : _latte.withOpacity(0.5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: index == 0 ? const Color(0xFFFFF3E6) : _mocha,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.95,
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return MenuCard(item: menu[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final CafeItem item;

  static const Color _espresso = Color(0xFF4B2E2B);
  static const Color _latte = Color(0xFFC8A27C);
  static const Color _caramel = Color(0xFFD9A066);
  static const Color _cream = Color(0xFFF6EFE7);
  static const Color _mocha = Color(0xFF6F4E37);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF6),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _latte.withOpacity(0.35)),
        boxShadow: [
          BoxShadow(
            color: _espresso.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _cream,
                    border: Border.all(color: _latte.withOpacity(0.4)),
                  ),
                  child: Icon(item.icon, size: 40, color: _mocha),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: _espresso,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₱${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _caramel,
                  ),
                ),
              ],
            ),
          ),
          if (item.bestSeller)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_caramel, Color(0xFFB87B4A)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '★ Best Seller',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

