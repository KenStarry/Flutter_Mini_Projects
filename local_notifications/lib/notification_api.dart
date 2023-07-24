import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notifications/utils.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final notificationsListener = BehaviorSubject<String?>();

  static Future initialize() async {
    var androidInitialize =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    var iosInitialize = const DarwinInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);

    await _initTimeZones();

    //  when app is closed
    final details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      notificationsListener.add(details.notificationResponse?.payload);
    }

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (response) =>
            notificationsListener.add(response.payload));
  }

  static Future<void> _initTimeZones() async {
    tz.initializeTimeZones();
  }

  //  show normal notification
  static Future showBigTextNotification({
    id = 0,
    required String title,
    required String body,
    payload,
  }) async {
    final largeIconPath = await Utils.downloadFile(
        'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=415&q=80',
        'cool cat');
    final bigPicturePath = await Utils.downloadFile(
        'https://images.unsplash.com/photo-1551884831-bbf3cdc6469e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=974&q=80',
        'laughing horse');

    final styleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath));

    final sound = 'my_sound.mp3';

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('my app', 'home',
            playSound: true,
            sound: RawResourceAndroidNotificationSound(sound.split('.').first),
            importance: Importance.low,
            priority: Priority.high,
            styleInformation: styleInformation);

    DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails(presentSound: true,
        sound: sound);

    var notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails,
        payload: "https://images.unsplash.com/photo-1551884831-bbf3cdc6469e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=974&q=80");
  }

  //  schedule a notification
  static Future scheduleBigTextNotification({
    id = 0,
    required String title,
    required String body,
    required DateTime scheduledDate,
    payload,
  }) async {

    final largeIconPath = await Utils.downloadFile(
        'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=415&q=80',
        'cool cat');
    final bigPicturePath = await Utils.downloadFile(
        'https://images.unsplash.com/photo-1551884831-bbf3cdc6469e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=974&q=80',
        'laughing horse');

    final styleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath));

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('my app', 'home',
            playSound: true,
            importance: Importance.max,
            priority: Priority.high,
            styleInformation: styleInformation);

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();

    var notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(0, title, body,
        tz.TZDateTime.from(scheduledDate, tz.local), notificationDetails,
        payload: "https://images.unsplash.com/photo-1551884831-bbf3cdc6469e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=974&q=80",
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  //  schedule a notification on a daily basis at 8am
  static Future scheduleDailyBigTextNotification({
    id = 0,
    required String title,
    required String body,
    required DateTime scheduledDate,
    payload,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('my app', 'home',
            playSound: true,
            importance: Importance.max,
            priority: Priority.high);

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();

    var notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0, title, body, _scheduleDaily(Time(8, 30)), notificationDetails,
        payload: "Something",
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  //  schedule a notification on a weekly basis at 8am
  static Future scheduleWeeklyBigTextNotification({
    id = 0,
    required String title,
    required String body,
    required DateTime scheduledDate,
    payload,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('my app', 'home',
            playSound: true,
            importance: Importance.max,
            priority: Priority.high);

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();

    var notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        _scheduleWeekly(Time(8, 30), days: [DateTime.monday, DateTime.friday]),
        notificationDetails,
        payload: "Something",
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    //  current time
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);

    //  check if date is not in the past already
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;
  }

  static tz.TZDateTime _scheduleWeekly(Time time, {required List<int> days}) {
    tz.TZDateTime scheduledDate = _scheduleDaily(time);

    //  if the day today is not in the list of days
    while (!days.contains(scheduledDate.weekday)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }

    return scheduledDate;
  }

  static void cancelNotification(int id) => flutterLocalNotificationsPlugin.cancel(id);
  static void cancelAllNotifications() => flutterLocalNotificationsPlugin.cancelAll();
}
