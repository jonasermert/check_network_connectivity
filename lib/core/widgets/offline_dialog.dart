import 'package:flutter/material.dart';

class OfflineDialog extends StatelessWidget {
  const OfflineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Keine Internetverbindung'),
      content: const Text('Bitte stelle eine Verbindung zum Internet her.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Erneut prüfen'),
        ),
      ],
    );
  }
}
