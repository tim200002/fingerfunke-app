class InvalidStateException implements Exception {
  @override
  String toString() {
    return "The given action is not supported in the current state. This is a fatal error. Please inform the developers about this error.";
  }
}
