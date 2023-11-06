extension UrlProcessing on String {
  String extractNameFromUrl() {
    final parts = split('.com/');

    if (parts.length < 2) {
      return this;
    }

    final name = parts[1]
        .replaceAll('_', ' ')
        .replaceAll('%2C', ',')
        .replaceAll('%26', '&');

    return name;
  }
}
