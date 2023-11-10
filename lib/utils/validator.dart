String? validateEmail(String? value) {
  const String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  final RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return '';
  } else if (!regex.hasMatch(value)) {
    return '';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return '';
  }
  if (value.length < 6) {
    return 'Password should be at least 6 characters';
  }
  return null;
}

String? validateName(String? value) {
  if (value!.isEmpty) {
    return 'Name is required';
  }

  return null;
}
