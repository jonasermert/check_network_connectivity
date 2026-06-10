import 'package:flutter/material.dart';

import '../../../core/services/network_service.dart';

class NetworkStatusCard extends StatelessWidget {
  const NetworkStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: NetworkService.instance.stream,
      builder: (context, snapshot) {
        final online = snapshot.data ?? true;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(online ? Icons.wifi : Icons.wifi_off, size: 64),
                const SizedBox(height: 16),
                Text(
                  online ? 'Online' : 'Offline',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
