import 'dart:async';

import 'package:flutter/material.dart';

import '../services/network_service.dart';
import 'offline_dialog.dart';

class NetworkListener extends StatefulWidget {
  final Widget child;

  const NetworkListener({super.key, required this.child});

  @override
  State<NetworkListener> createState() => _NetworkListenerState();
}

class _NetworkListenerState extends State<NetworkListener> {
  StreamSubscription<bool>? _subscription;

  bool _dialogVisible = false;

  @override
  void initState() {
    super.initState();

    NetworkService.instance.initialize();

    _subscription = NetworkService.instance.stream.listen((connected) {
      if (!mounted) return;

      if (!connected && !_dialogVisible) {
        _showDialog();
      }

      if (connected && _dialogVisible && Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
        _dialogVisible = false;
      }
    });
  }

  Future<void> _showDialog() async {
    _dialogVisible = true;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const OfflineDialog(),
    );

    _dialogVisible = false;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
