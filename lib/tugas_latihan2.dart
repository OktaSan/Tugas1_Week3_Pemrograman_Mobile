import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DaftarProduk(),
    );
  }
}

class DaftarProduk extends StatelessWidget {
  const DaftarProduk({super.key});

  final List<Map<String, dynamic>> produk = const [
    {'nama': 'Laptop', 'harga': 8500000},
    {'nama': 'Smartphone', 'harga': 3200000},
    {'nama': 'Headphone', 'harga': 450000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, i) {
          final p = produk[i];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(p['nama']),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProduk(
                    nama: p['nama'],
                    harga: p['harga'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailProduk extends StatelessWidget {
  final String nama;
  final int harga;
  const DetailProduk({super.key, required this.nama, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama: $nama', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text('Harga: Rp $harga', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
