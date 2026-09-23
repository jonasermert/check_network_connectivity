import 'package:flutter/material.dart';

import '../../ui/app_theme.dart';
import '../services/network_service.dart';

class OfflineDialog extends StatefulWidget {
  const OfflineDialog({super.key});

  @override
  State<OfflineDialog> createState() => _OfflineDialogState();
}

class _OfflineDialogState extends State<OfflineDialog> {
  bool checking = false;

  Future<void> retry() async {
    setState(() => checking = true);
    try {
      final connected = await NetworkService.instance.refresh();
      if (connected && mounted) Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => checking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.wifi_off_rounded, color: AppTheme.accent, size: 40),
      title: const Text('Keine Internetverbindung'),
      content: const Text('Prüfe WLAN oder mobile Daten und versuche es erneut.'),
      actions: [
        FilledButton.icon(
          onPressed: checking ? null : retry,
          icon: checking
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.refresh_rounded),
          label: const Text('Erneut prüfen'),
        ),
      ],
    );
  }
}
