import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class IntroCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String desc;

  const IntroCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: AppColors.glass,
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: const [
          BoxShadow(
            blurRadius: 30,
            color: Color(0x33000000),
            offset: Offset(0, 18),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.width * 0.35,
            width: size.width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [AppColors.emerald, AppColors.indigo],
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 2,
                  color: Color(0x4410B981),
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Icon(icon, size: size.width * 0.18, color: Colors.white),
          ),
          const SizedBox(height: 26),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB9C6FF),
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.5,
                height: 1.5,
                color: AppColors.textSoft,
              ),
            ),
          ),
        ],
      ),
    );
  }
}