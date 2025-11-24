class Validators {
  static String? required(String? value, {String message = "Wajib diisi"}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return "Email wajib diisi";
    const pattern =
        r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (!RegExp(pattern).hasMatch(value)) return "Email tidak valid";
    return null;
  }

  static String? minLength(String? value, int min) {
    if (value == null || value.length < min) {
      return "Minimal $min karakter";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || !RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return "Nomor telepon tidak valid";
    }
    return null;
  }
}
