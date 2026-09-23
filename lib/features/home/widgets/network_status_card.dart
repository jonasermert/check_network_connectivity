import 'package:flutter/material.dart';

import '../../../core/services/network_service.dart';
import '../../../ui/app_theme.dart';

class NetworkStatusCard extends StatelessWidget {
  const NetworkStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: NetworkService.instance.stream,
      builder: (context, snapshot) {
        final online = snapshot.data;
        final label = online == null ? 'Wird geprüft' : online ? 'Online' : 'Offline';
        final message = online == null
            ? 'Die Verbindung wird überprüft.'
            : online
                ? 'Du bist mit dem Internet verbunden.'
                : 'Derzeit ist keine Internetverbindung verfügbar.';

        return Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.accent.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    online == null ? Icons.sync : online ? Icons.wifi_rounded : Icons.wifi_off_rounded,
                    size: 36,
                    color: AppTheme.accent,
                  ),
                ),
                const SizedBox(height: 24),
                Text('VERBINDUNGSSTATUS',
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    )),
                const SizedBox(height: 8),
                Text(label, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(message, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => NetworkService.instance.refresh(),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Erneut prüfen'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
