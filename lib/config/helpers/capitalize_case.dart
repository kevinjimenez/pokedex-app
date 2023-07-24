class CapitalizeCase {
  static String titleCase(String work) {
    final a = work.split('');
    final b = a.first.toUpperCase();
    a[0] = b;
    return a.join('');
  }
}