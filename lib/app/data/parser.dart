double checkIfDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  }
  return value + .0;
}
