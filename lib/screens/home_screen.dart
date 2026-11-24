import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _soon(BuildContext context, String fitur) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur $fitur segera hadir')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.hijauTua, AppColors.hijau],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/image/logo.png'), width: 100,),
                SizedBox(height: 6),
                Text('Platform Agrikultur Nusantara Edukasi Niaga',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
                SizedBox(height: 10),
                Text('Sugeng rawuh, Juragan!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Card(
              color: AppColors.hijauPucat,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.auto_awesome, color: AppColors.emas, size: 36),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Wangsit Hari Ini',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.hijauTua)),
                          SizedBox(height: 4),
                          Text(
                              'Hujan deras diperkirakan lusa. Tunda penyemprotan pestisida.',
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text('Menu Utama',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.hijauTua)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                MenuCard(
                    icon: Icons.document_scanner,
                    label: 'Cek Penyakit',
                    onTap: () => _soon(context, 'Cek Penyakit')),
                MenuCard(
                    icon: Icons.storefront,
                    label: 'Pasar Tani',
                    onTap: () => _soon(context, 'Pasar Tani')),
                MenuCard(
                    icon: Icons.cloud,
                    label: 'Cuaca',
                    onTap: () => _soon(context, 'Cuaca')),
                MenuCard(
                    icon: Icons.groups,
                    label: 'Komunitas',
                    onTap: () => _soon(context, 'Komunitas')),
                MenuCard(
                    icon: Icons.calendar_month,
                    label: 'Jadwal Tanam',
                    onTap: () => _soon(context, 'Jadwal Tanam')),
                MenuCard(
                    icon: Icons.notifications_active,
                    label: 'Peringatan Hama',
                    onTap: () => _soon(context, 'Peringatan Hama')),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
