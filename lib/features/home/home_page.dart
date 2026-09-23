import 'package:flutter/material.dart';

import '../../ui/app_theme.dart';
import 'widgets/network_status_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Netzwerkstatus')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(24),
              children: [
                const Text(
                  'VERBINDUNG IM BLICK',
                  style: TextStyle(
                    color: AppTheme.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Immer wissen, ob du online bist.',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Der aktuelle Status wird automatisch aktualisiert, sobald sich deine Verbindung ändert.',
                  style: TextStyle(color: AppTheme.muted, height: 1.6),
                ),
                const SizedBox(height: 32),
                const NetworkStatusCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
