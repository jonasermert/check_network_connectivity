import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  NetworkService._();

  static final instance = NetworkService._();

  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  Stream<bool> get stream => _controller.stream;

  StreamSubscription? _subscription;
  bool? _lastResult;
  bool _checking = false;

  Future<void> initialize() async {
    if (_subscription != null) return;
    _subscription = Connectivity().onConnectivityChanged.listen((_) => refresh());
    await refresh();
  }

  Future<bool> refresh() async {
    if (_checking) return _lastResult ?? false;
    _checking = true;
    try {
      final connected = await InternetConnectionChecker.instance.hasConnection;
      _lastResult = connected;
      _controller.add(connected);
      return connected;
    } finally {
      _checking = false;
    }
  }

  Future<bool> isConnected() => InternetConnectionChecker.instance.hasConnection;

  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
