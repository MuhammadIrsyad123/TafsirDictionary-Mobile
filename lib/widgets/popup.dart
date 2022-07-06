import 'package:flutter/material.dart';

enum MenuAction { logout }

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Log Keluar'),
        content: const Text('Anda pasti ingin log keluar?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Tidak')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Ya')),
        ],
      );
    },
  ).then((value) => value ?? false);
}

Future showNoJawapanDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text(
          'Makluman',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Maaf, soalan masih belum dijawab.',
          style: TextStyle(fontSize: 15),
        ),
      );
    },
  ).then((value) => value ?? false);
}
