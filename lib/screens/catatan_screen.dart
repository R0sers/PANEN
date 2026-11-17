import 'package:flutter/material.dart';

import '../models/catatan.dart';
import '../theme/app_theme.dart';

class CatatanScreen extends StatefulWidget {
  const CatatanScreen({super.key});

  @override
  State<CatatanScreen> createState() => _CatatanScreenState();
}

class _CatatanScreenState extends State<CatatanScreen> {
  final List<Catatan> _data = [
    Catatan(judul: 'Beli pupuk NPK', nominal: 450000, pemasukan: false),
    Catatan(judul: 'Panen cabai 120 kg', nominal: 3600000, pemasukan: true),
  ];

  int get _saldo => _data.fold(
      0, (sum, c) => sum + (c.pemasukan ? c.nominal : -c.nominal));

  void _tambah() {
    final judul = TextEditingController();
    final nominal = TextEditingController();
    bool pemasukan = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => Padding(
          padding: EdgeInsets.fromLTRB(
              20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Catatan Baru',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: true, label: Text('Pemasukan')),
                  ButtonSegment(value: false, label: Text('Pengeluaran')),
                ],
                selected: {pemasukan},
                onSelectionChanged: (s) =>
                    setSheet(() => pemasukan = s.first),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: judul,
                decoration: const InputDecoration(
                    labelText: 'Keterangan', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nominal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Nominal (Rp)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    final n = int.tryParse(nominal.text) ?? 0;
                    if (judul.text.trim().isEmpty || n <= 0) return;
                    setState(() => _data.insert(
                        0,
                        Catatan(
                            judul: judul.text.trim(),
                            nominal: n,
                            pemasukan: pemasukan)));
                    Navigator.pop(ctx);
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final untung = _saldo >= 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Tani')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambah,
        icon: const Icon(Icons.add),
        label: const Text('Catat'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [AppColors.hijauTua, AppColors.hijauMuda]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(untung ? 'Untung Musim Ini' : 'Rugi Musim Ini',
                    style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 6),
                Text(formatRupiah(_saldo),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          Expanded(
            child: _data.isEmpty
                ? const Center(child: Text('Belum ada catatan'))
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
                    itemCount: _data.length,
                    itemBuilder: (_, i) {
                      final c = _data[i];
                      final warna =
                          c.pemasukan ? AppColors.hijau : AppColors.merah;
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: warna.withOpacity(0.12),
                            child: Icon(
                                c.pemasukan
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color: warna),
                          ),
                          title: Text(c.judul),
                          subtitle: Text(
                              '${c.tanggal.day}/${c.tanggal.month}/${c.tanggal.year}'),
                          trailing: Text(
                            '${c.pemasukan ? '+' : '-'}${formatRupiah(c.nominal)}',
                            style: TextStyle(
                                color: warna, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
