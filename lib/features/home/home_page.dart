import 'package:flutter/material.dart';

import 'widgets/network_status_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Netzwerkstatus')),
      body: const Center(child: NetworkStatusCard()),
    );
  }
}
