import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  NetworkService._();

  static final instance = NetworkService._();

  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  Stream<bool> get stream => _controller.stream;

  StreamSubscription? _subscription;

  Future<void> initialize() async {
    final hasConnection =
        await InternetConnectionChecker.instance.hasConnection;

    _controller.add(hasConnection);

    _subscription = Connectivity().onConnectivityChanged.listen((_) async {
      final connected = await InternetConnectionChecker.instance.hasConnection;

      _controller.add(connected);
    });
  }

  Future<bool> isConnected() {
    return InternetConnectionChecker.instance.hasConnection;
  }

  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
