class Validators {
  static String? phone(String? v) {
    final value = (v ?? "").trim();
    if (value.isEmpty) return "মোবাইল নাম্বার দিন";
    if (value.length < 11) return "সঠিক মোবাইল নাম্বার দিন";
    return null;
  }

  static String? password(String? v) {
    final value = (v ?? "").trim();
    if (value.isEmpty) return "পাসওয়ার্ড দিন";
    if (value.length < 4) return "কমপক্ষে 4 অক্ষর দিন";
    return null;
  }
}