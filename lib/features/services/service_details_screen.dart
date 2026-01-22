import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'models/service_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceModel service;
  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgTop,
        foregroundColor: Colors.white,
        title: const Text("Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.bgTop, AppColors.bgBottom],
          ),
        ),
        child: Column(
          children: [
            _InfoCard(
              title: service.title,
              subtitle: service.subtitle,
              icon: Icons.person_pin_rounded,
            ),
            const SizedBox(height: 12),
            _Line(icon: Icons.call_rounded, text: service.phone),
            _Line(icon: Icons.location_on_rounded, text: service.address),
            _Line(icon: Icons.category_rounded, text: service.category),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: _CallButton(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Call feature add later ✅")),
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

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.glass,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(colors: [AppColors.emerald, AppColors.indigo]),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: AppColors.textSoft)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Line({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.glass,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _CallButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CallButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(colors: [AppColors.emerald, AppColors.indigo]),
          boxShadow: const [
            BoxShadow(
              blurRadius: 25,
              color: Color(0x4410B981),
              offset: Offset(0, 12),
            )
          ],
        ),
        child: const Center(
          child: Text(
            "Call Now",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}