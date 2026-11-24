import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class EdukasiScreen extends StatelessWidget {
  const EdukasiScreen({super.key});

  static const _anggota = [
    (
      nama: 'Nanda Maulana',
      npm: '5520124001',
      keterangan: 'Ketua Tim • Project Manager',
      image: 'assets/image/f2.png',
    ),
    (
      nama: 'M.Rommy Arianugraha',
      npm: '5520124014',
      keterangan: 'Mobile Developer (Flutter)',
      image: 'assets/image/f1.png',
    ),
    (
      nama: 'Robi Septiandi',
      npm: '5520124028',
      keterangan: 'UI/UX Designer',
      image: 'assets/image/f3.jpeg',
    ),
    (
      nama: 'Muchamad Faza Fadillah',
      npm: '5520124016',
      keterangan: 'Backend & Database',
      image: 'assets/image/f4.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Tim')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _anggota.length,
        itemBuilder: (_, i) {
          final a = _anggota[i];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.hijau, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        a.image,
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    a.nama,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'NPM: ${a.npm}',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.hijauPucat,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      a.keterangan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.hijau,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
