import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class EdukasiScreen extends StatelessWidget {
  const EdukasiScreen({super.key});

  static const _materi = [
    (Icons.grass, 'Pembibitan Cabai', 'Cara semai benih agar tumbuh seragam'),
    (Icons.bug_report, 'Mengenal Hama Wereng', 'Ciri serangan dan cara pengendalian'),
    (Icons.science, 'Pupuk Organik vs Kimia', 'Takaran dan waktu pemupukan yang tepat'),
    (Icons.water_drop, 'Irigasi Hemat Air', 'Atur pengairan saat musim kemarau'),
    (Icons.inventory_2, 'Pascapanen', 'Jaga mutu hasil panen sebelum dijual'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edukasi Tani')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _materi.length,
        itemBuilder: (_, i) {
          final m = _materi[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.hijauPucat,
                child: Icon(m.$1, color: AppColors.hijau),
              ),
              title: Text(m.$2,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(m.$3),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
