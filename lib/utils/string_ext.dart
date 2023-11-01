extension UrlProcessing on String {
  String extractNameFromUrl() {
    final parts = split('.com/');

    if (parts.length < 2) {
      return this;
    }

    final name = parts[1].replaceAll('_', ' ');
    return name;
  }
}
