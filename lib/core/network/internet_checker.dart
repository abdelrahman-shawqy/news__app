import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class InternetConnectionss {
  Future<bool> get isConnected;
  Stream<bool> get onStatusChange;
}

@LazySingleton(as: InternetConnectionss)
class InternetConnectionImpl implements InternetConnectionss {
  final Connectivity _connectivity;
  final InternetConnection _connectionChecker;

  InternetConnectionImpl(
      this._connectivity,
      this._connectionChecker,
      );

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();

    // No network interface at all
    if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      return false;
    }

    // Network interface exists → verify real internet access
    return await _connectionChecker.hasInternetAccess;
  }

  @override
  Stream<bool> get onStatusChange {
    return _connectionChecker.onStatusChange.map(
          (status) => status == InternetStatus.connected,
    );
  }
}