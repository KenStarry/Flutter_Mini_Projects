import 'package:flutter/material.dart';
import 'package:local_notifications/detail_screen.dart';
import 'package:local_notifications/notification_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    NotificationApi.initialize();
    listenOnNotifications();
  }

  //  Listen on notifications using rxdart
  void listenOnNotifications() => NotificationApi.notificationsListener.stream
      .listen(onNotificationClicked);

  void onNotificationClicked(String? payload) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailScreen(payload: payload)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                  child: Align(
                child: FilledButton(
                  onPressed: () {
                    NotificationApi.showBigTextNotification(
                        title: "Hello", body: "My name is Starry");
                  },
                  child: Text("Simple Notification"),
                ),
              )),
              Expanded(
                  child: Align(
                child: FilledButton(
                  onPressed: () {
                    NotificationApi.scheduleBigTextNotification(
                        title: "Good Afternoon", body: "This was planned before",
                    scheduledDate: DateTime.now().add(const Duration(days: 1)));
                  },
                  child: Text("Scheduled Notification"),
                ),
              )),
              Expanded(
                  child: Align(
                child: FilledButton(
                  onPressed: () {},
                  child: Text("Remove Notifications"),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
