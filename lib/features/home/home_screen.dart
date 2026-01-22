import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../routes.dart';
import 'widgets/service_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.bgTop, AppColors.bgBottom],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Text(
                        AppStrings.appNameBn,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.glass,
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.location_on_rounded, color: AppColors.emerald, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "সরিষাবাড়ী",
                              style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    AppStrings.taglineEn,
                    style: TextStyle(color: AppColors.textSoft),
                  ),
                  const SizedBox(height: 18),

                  // Search Bar (Fake)
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.services),
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.glass,
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search_rounded, color: Colors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Search services, doctors, emergency...",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          Icon(Icons.arrow_forward_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),
                  const Text(
                    "Quick Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: [
                        ServiceTile(
                          title: "ডাক্তার",
                          icon: Icons.medical_services_rounded,
                          onTap: () => Navigator.pushNamed(context, AppRoutes.services),
                        ),
                        ServiceTile(
                          title: "হাসপাতাল",
                          icon: Icons.local_hospital_rounded,
                          onTap: () => Navigator.pushNamed(context, AppRoutes.services),
                        ),
                        ServiceTile(
                          title: "অ্যাম্বুলেন্স",
                          icon: Icons.emergency_rounded,
                          onTap: () => Navigator.pushNamed(context, AppRoutes.emergency),
                        ),
                        ServiceTile(
                          title: "রক্ত ডোনার",
                          icon: Icons.bloodtype_rounded,
                          onTap: () => Navigator.pushNamed(context, AppRoutes.services),
                        ),
                        ServiceTile(
                          title: "থানা",
                          icon: Icons.local_police_rounded,
                          onTap: () => Navigator.pushNamed(context, AppRoutes.emergency),
                        ),
                        ServiceTile(
                          title: "ফায়ার সার্ভিস",
                          icon: Icons.fire_truck_rounded,
                          onTap: () => Navigator.pushNamed(context, AppRoutes.emergency),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}