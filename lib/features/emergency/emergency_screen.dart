import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      ("Emergency", "999", Icons.warning_rounded),
      ("Police", "999 / 100", Icons.local_police_rounded),
      ("Fire Service", "102", Icons.fire_truck_rounded),
      ("Ambulance", "01800000000", Icons.emergency_rounded),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgTop,
        foregroundColor: Colors.white,
        title: const Text("Emergency"),
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
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, i) {
            final title = items[i].$1;
            final phone = items[i].$2;
            final icon = items[i].$3;

            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: AppColors.glass,
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Row(
                children: [
                  Container(
                    height: 52,
                    width: 52,
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
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          phone,
                          style: const TextStyle(color: AppColors.textSoft),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Call $phone later ✅")),
                      );
                    },
                    icon: const Icon(Icons.call_rounded, color: Colors.white70),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}