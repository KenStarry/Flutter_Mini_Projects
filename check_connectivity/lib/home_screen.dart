import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription streamSubscription;
  late StreamSubscription internetSubscription;
  bool hasInternet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    streamSubscription =
        Connectivity().onConnectivityChanged.listen(_showConnectivity);

    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final isConnected = status == InternetConnectionStatus.connected;
      setState(() {
        hasInternet = isConnected;
      });
    });
  }

  void _showConnectivity(ConnectivityResult result) {
    //  check if device has internet
    final hasInternet = result != ConnectivityResult.none;

    final message = hasInternet
        ? result == ConnectivityResult.mobile
            ? 'You are connected to mobile network'
            : 'You are connected to wifi network'
        : 'You have no internet';

    final color = hasInternet ? Colors.greenAccent : Colors.redAccent;

    _showSnackbar(context, message, color);
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    final snackbar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Widget buildInternetStatus() => Column(
        children: [
          Text('Connection Status'),
          Row(
            children: [
              Icon(
                hasInternet ? Icons.check : Icons.cancel,
                color: hasInternet ? Colors.greenAccent : Colors.redAccent,
              ),
              const SizedBox(width: 24,),
              Text(hasInternet ? 'Connected to internet' : 'not connected to internet')
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildInternetStatus(),
            ElevatedButton(
                onPressed: () async {
                  //  check connectivity
                  var result = await Connectivity().checkConnectivity();
                  _showConnectivity(result);
                },
                child: Text("Check connectivity"))
          ],
        ),
      ),
    );
  }
}
