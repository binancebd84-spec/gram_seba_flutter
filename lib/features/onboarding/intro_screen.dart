import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../routes.dart';
import 'widgets/intro_card.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int index = 0;

  final pages = const [
    (
      Icons.grid_view_rounded,
      AppStrings.appNameBn,
      AppStrings.taglineBn,
      "এক অ্যাপেই পাবেন জরুরি নম্বর, লোকাল ডিরেক্টরি, দ্রুত সার্চ ও প্রয়োজনীয় তথ্য।"
    ),
    (
      Icons.manage_search_rounded,
      "দ্রুত সার্চ",
      "Smart Directory • Fast Search",
      "ডাক্তার, হাসপাতাল, রক্ত, অ্যাম্বুলেন্স, থানার নাম্বার—সব সহজে খুঁজে পান।"
    ),
    (
      Icons.local_hospital_rounded,
      "জরুরি সেবা",
      "Emergency Ready",
      "যেকোনো জরুরিতে এক ক্লিকেই যোগাযোগ করুন। নিরাপদ থাকুন, প্রস্তুত থাকুন।"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.8, -0.9),
                radius: 1.3,
                colors: [
                  Color(0x3310B981),
                  Color(0x226366F1),
                  AppColors.bgTop,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      _Badge(text: "NEW • 2026", icon: Icons.auto_awesome_rounded),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
                        child: const Text("Skip"),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: pages.length,
                    onPageChanged: (i) => setState(() => index = i),
                    itemBuilder: (context, i) {
                      final p = pages[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: IntroCard(
                          icon: p.$1,
                          title: p.$2,
                          subtitle: p.$3,
                          desc: p.$4,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                _Dots(count: pages.length, activeIndex: index),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: _PremiumButton(
                      text: index == pages.length - 1 ? "Get Started" : "Next",
                      icon: Icons.arrow_forward_rounded,
                      onTap: () {
                        if (index < pages.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, AppRoutes.login);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final IconData icon;
  const _Badge({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.glass,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.emerald),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int activeIndex;
  const _Dots({required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: active ? 22 : 8,
          decoration: BoxDecoration(
            color: active ? AppColors.emerald : const Color(0x44FFFFFF),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}

class _PremiumButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _PremiumButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [AppColors.emerald, AppColors.indigo],
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 25,
              color: Color(0x4410B981),
              offset: Offset(0, 12),
            )
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 10),
              Icon(icon, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}