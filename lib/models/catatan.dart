class Catatan {
  final String judul;
  final int nominal;
  final bool pemasukan;
  final DateTime tanggal;

  Catatan({
    required this.judul,
    required this.nominal,
    required this.pemasukan,
    DateTime? tanggal,
  }) : tanggal = tanggal ?? DateTime.now();
}

String formatRupiah(int n) {
  final s = n.abs().toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return '${n < 0 ? '-' : ''}Rp $buf';
}
