import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../routes.dart';
import 'models/service_model.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final searchCtrl = TextEditingController();

  final List<ServiceModel> all = const [
    ServiceModel(
      title: "ডা. মোঃ করিম",
      subtitle: "MBBS • মেডিসিন",
      phone: "01700000000",
      address: "সরিষাবাড়ী, জামালপুর",
      category: "ডাক্তার",
    ),
    ServiceModel(
      title: "সরিষাবাড়ী হাসপাতাল",
      subtitle: "24/7 জরুরি সেবা",
      phone: "01900000000",
      address: "সরিষাবাড়ী বাজার রোড",
      category: "হাসপাতাল",
    ),
    ServiceModel(
      title: "অ্যাম্বুলেন্স সার্ভিস",
      subtitle: "ফাস্ট রেসপন্স",
      phone: "01800000000",
      address: "সরিষাবাড়ী থানা মোড়",
      category: "অ্যাম্বুলেন্স",
    ),
    ServiceModel(
      title: "রক্ত ডোনার - Rahim",
      subtitle: "A+ • Available",
      phone: "01600000000",
      address: "পিংনা, সরিষাবাড়ী",
      category: "রক্ত",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final q = searchCtrl.text.trim().toLowerCase();
    final filtered = all.where((s) {
      return s.title.toLowerCase().contains(q) ||
          s.subtitle.toLowerCase().contains(q) ||
          s.category.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgTop,
        foregroundColor: Colors.white,
        title: const Text("Service Directory"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.bgTop, AppColors.bgBottom],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                controller: searchCtrl,
                onChanged: (_) => setState(() {}),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search by name, category...",
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: const Icon(Icons.search_rounded, color: Colors.white70),
                  filled: true,
                  fillColor: AppColors.glass,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, i) {
                  final s = filtered[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.serviceDetails,
                        arguments: s,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.glass,
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  colors: [AppColors.emerald, AppColors.indigo],
                                ),
                              ),
                              child: const Icon(Icons.support_agent_rounded, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    s.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    s.subtitle,
                                    style: const TextStyle(color: AppColors.textSoft),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.white38, size: 16)
                          ],
                        ),
                      ),
                    ),
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