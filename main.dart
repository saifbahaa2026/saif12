import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SaifPortfolioPage(),
      );
}
class SaifPortfolioPage extends StatelessWidget {
  const SaifPortfolioPage({Key? key}) : super(key: key);

  // دالة تشغيل الروابط الخارجية على الويب بسلاسة
  Future<void> _openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0505),
      body: Stack(
        children: [
          // شبكة النيون المتحركة بالخلفية
          const Positioned.fill(child: FullScreenRedPlexus()),

          // المحتوى البرمجي والـ UI للموقع
          SizedBox.expand(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      // الدائرة المضيئة مع صورتك الشخصية
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFF3333).withOpacity(0.9),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF3333).withOpacity(0.4),
                              blurRadius: 25,
                              spreadRadius: 4,
                            )
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/my_photo.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "HI, I'M SAIF BAHAA",
                        style: TextStyle(
                          color: Color(0xFFFF4D4D),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Web Developer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0xFFFF3333),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 25),
                      // أزرار السوشيال ميديا بعد ربط حساباتك الحقيقية
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // زر الإنستغرام مالتك
                          _socialIcon(Icons.camera_alt_outlined, () => _openUrl("https://instagram.com/saifbahaa1")),
                          // زر التليغرام مالتك
                          _socialIcon(Icons.telegram_outlined, () => _openUrl("https://t.me/saifbahaa1")),
                          // زر التيك توك مالتك
                          _socialIcon(Icons.audiotrack_outlined, () => _openUrl("https://www.tiktok.com/@saifbahaa1")),
                          // زر الحفظ أو التنبيهات
                          _socialIcon(Icons.notifications_none_outlined, () => _openUrl("https://t.me/saifbahaa1")),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF3333),
                          foregroundColor: Colors.white,
                          shadowColor: const Color(0xFFFF3333).withOpacity(0.6),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        ),
                        child: const Text(
                          "DOWNLOAD CV",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1),
                        ),
                      ),

                      const SizedBox(height: 40),
                      // واجهة تفاصيل السيرة الذاتية (CV) باللغة العربية
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D0A0A).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFFFF3333).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "(CV) السيرة الذاتية",
                              style: TextStyle(
                                color: Color(0xFFFF4D4D),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(height: 20),
                            _cvRow("المعلومات الشخصية:", "سيف بهاء | مواليد 2001 | الإقامة: العراق، محافظة ديالى"),
                            _cvRow("التعليم الأكاديمي:", "طالب في مرحلة البكالوريوس - هندسة تقنيات الحاسوب"),
                            _cvRow("المشاريع البرمجية:", "تطوير وبناء واجهة موقع البورتفوليو الشخصي الشامل والمتجاوب لعرض الحلول والخدمات البرمجية باستخدام بيئة Flutter Web و Python"),
                            _cvRow("المهارات التقنية:", "Dart / Flutter Web, Python, SQL :واجهات المستخدم المتجاوبة (UI/UX)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _socialIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF2D0A0A).withOpacity(0.5),
          border: Border.all(color: const Color(0xFFFF3333).withOpacity(0.6), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF3333).withOpacity(0.1),
              blurRadius: 8,
            )
          ],
        ),
        child: Icon(icon, color: const Color(0xFFFF4D4D), size: 22),
      ),
    );
  }

  Widget _cvRow(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFF4D4D),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.5,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
// كلاس الأنيميشن التفاعلي للحلفية النيون المتحركة (Red Plexus Effect)
class FullScreenRedPlexus extends StatefulWidget {
  const FullScreenRedPlexus({Key? key}) : super(key: key);

  @override
  State<FullScreenRedPlexus> createState() => _FullScreenRedPlexusState();
}

class _FullScreenRedPlexusState extends State<FullScreenRedPlexus> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Map<String, dynamic>> _particles = [];
  final Random _random = Random();
  final int _particleCount = 45;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < _particleCount; i++) {
      _particles.add({
        'relX': _random.nextDouble(),
        'relY': _random.nextDouble(),
        'speed': 0.3 + _random.nextDouble() * 0.7,
        'angle': _random.nextDouble() * pi * 2,
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: RedPlexusPainter(_particles, _controller.value),
        );
      },
    );
  }
}

class RedPlexusPainter extends CustomPainter {
  final List<Map<String, dynamic>> particles;
  final double animationValue;

  RedPlexusPainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFFFF3333).withOpacity(0.2)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = const Color(0xFFFF4D4D).withOpacity(0.7)
      ..style = PaintingStyle.fill;

    List<Offset> actualPositions = [];

    for (var p in particles) {
      double timeFactor = animationValue * pi * 2 * p['speed'];
      double dx = sin(timeFactor + p['angle']) * 15;
      double dy = cos(timeFactor + p['angle']) * 15;

      double x = (p['relX'] * size.width) + dx;
      double y = (p['relY'] * size.height) + dy;

      x = x.clamp(0.0, size.width);
      y = y.clamp(0.0, size.height);

      Offset pos = Offset(x, y);
      actualPositions.add(pos);

      canvas.drawCircle(pos, 3, dotPaint);
    }

    for (int i = 0; i < actualPositions.length; i++) {
      for (int j = i + 1; j < actualPositions.length; j++) {
        double distance = (actualPositions[i] - actualPositions[j]).distance;
        double maxDistance = 160.0;

        if (distance < maxDistance) {
          double opacity = (1.0 - (distance / maxDistance)) * 0.25;
          linePaint.color = const Color(0xFFFF3333).withOpacity(opacity);
          canvas.drawLine(actualPositions[i], actualPositions[j], linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant RedPlexusPainter oldDelegate) => true;
}