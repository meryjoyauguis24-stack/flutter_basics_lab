import 'package:flutter/material.dart';

import 'student.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: studentColor,
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Activity 1 - $studentName'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: const Color(0xFFB23A6B),
        ),
        body: const Center(child: ProfileCard()),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  // Girlie palette: rose, pink, peach
  static const Color _rose = Color(0xFFFF6FA5);
  static const Color _peach = Color(0xFFFFB4A2);
  static const Color _blush = Color(0xFFFFE3EE);
  static const Color _cream = Color(0xFFFFF6FA);
  static const Color _ink = Color(0xFF4A2C3A);
  static const Color _muted = Color(0xFF9C6B7E);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_cream, Color(0xFFFFEAF3)],
          ),
          boxShadow: [
            BoxShadow(
              color: _rose.withValues(alpha: 0.25),
              blurRadius: 36,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar with pink→peach gradient ring + sparkle
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [_rose, _peach],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 54,
                      backgroundColor: _blush,
                      child: const Icon(Icons.face_3, size: 64, color: _rose),
                    ),
                  ),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        size: 20,
                        color: _rose,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'MERY JOY AUGUIS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: _ink,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [_blush, Color(0xFFFFD6E4)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'BS Information Technology',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _rose,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _InfoRow(
                icon: Icons.favorite_rounded,
                text: 'meryjoyauguis24@gmail.com',
                iconColor: _rose,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.phone_rounded,
                text: '09304287193',
                iconColor: const Color(0xFFFF8FA3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2F7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFFD9E7), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14.5,
              color: Color(0xFF4A2C3A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
