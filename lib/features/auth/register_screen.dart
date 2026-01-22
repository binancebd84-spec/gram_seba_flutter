import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/validators.dart';
import '../../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool showPass = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.bgTop, Color(0xFF101B3D)],
              ),
            ),
          ),
          Positioned(left: -40, top: 80, child: _GlowBlob(color: const Color(0x6610B981))),
          Positioned(right: -30, bottom: 120, child: _GlowBlob(color: const Color(0x666366F1))),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                      ),
                      const Spacer(),
                      _Badge(text: "Create Account", icon: Icons.person_add_alt_1_rounded),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "নতুন একাউন্ট ✨",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Gram Seba ব্যবহার করতে আপনার তথ্য দিন",
                    style: TextStyle(fontSize: 14.5, color: AppColors.textSoft),
                  ),
                  const SizedBox(height: 20),

                  _GlassCard(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          _InputField(
                            label: "নাম",
                            hint: "আপনার নাম লিখুন",
                            controller: nameCtrl,
                            prefix: Icons.person_rounded,
                            validator: (v) {
                              final value = (v ?? "").trim();
                              if (value.isEmpty) return "নাম দিন";
                              if (value.length < 2) return "সঠিক নাম দিন";
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          _InputField(
                            label: "মোবাইল নাম্বার",
                            hint: "01XXXXXXXXX",
                            controller: phoneCtrl,
                            prefix: Icons.phone_rounded,
                            keyboardType: TextInputType.phone,
                            validator: Validators.phone,
                          ),
                          const SizedBox(height: 12),
                          _InputField(
                            label: "পাসওয়ার্ড",
                            hint: "••••••••",
                            controller: passCtrl,
                            prefix: Icons.lock_rounded,
                            obscure: !showPass,
                            validator: Validators.password,
                            suffix: IconButton(
                              onPressed: () => setState(() => showPass = !showPass),
                              icon: Icon(
                                showPass ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          _PremiumButton(
                            text: loading ? "Please wait..." : "Create Account",
                            icon: Icons.check_circle_rounded,
                            onTap: loading
                                ? null
                                : () async {
                                    if (!formKey.currentState!.validate()) return;
                                    setState(() => loading = true);
                                    await Future.delayed(const Duration(seconds: 1));
                                    setState(() => loading = false);
                                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                                  },
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
                            child: const Text(
                              "Already have account? Login",
                              style: TextStyle(color: Color(0xFFB9C6FF)),
                            ),
                          ),
                        ],
                      ),
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

// ------- UI Helpers (same style as login) -------

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: child,
    );
  }
}

class _PremiumButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

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
      child: Opacity(
        opacity: onTap == null ? 0.6 : 1,
        child: Container(
          height: 54,
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

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const _InputField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.prefix,
    this.suffix,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            prefixIcon: Icon(prefix, color: Colors.white70),
            suffixIcon: suffix,
            filled: true,
            fillColor: const Color(0x18FFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
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

class _GlowBlob extends StatelessWidget {
  final Color color;
  const _GlowBlob({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 140,
            spreadRadius: 60,
            color: color,
          )
        ],
      ),
    );
  }
}