import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _notificationsPluginHelper =
      FlutterLocalNotificationsPlugin();
  // Initialize the notification system
  static Future<void> init() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Request permissions for Android
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();

  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestExactAlarmsPermission();

  // Initialize notification settings for Android and Linux
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("@mipmap/ic_launcher");
  // final LinuxInitializationSettings initializationSettingsLinux =
  //     LinuxInitializationSettings(defaultActionName: 'Open notification');
  final InitializationSettings initializationSettings =
      InitializationSettings(
          android: initializationSettingsAndroid,
          //linux: initializationSettingsLinux
          );

  await _notificationsPluginHelper.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) async {
      // This is called when a notification is tapped/interacted with
      debugPrint('Notification clicked: ${response.payload}');
      
      // Schedule the next daily reminders after interaction
      await scheduleDailyReminders();
    },
  );
  // Schedule the reminders for meals after initialization
  await scheduleDailyReminders();
}

  // Method to schedule notifications for specific times
  static Future scheduleNoti(
      {required String title,
      required String body,
      required String payload,
      required DateTime scheduledTime}) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Calcutta'));
    final tz.TZDateTime scheduledTZTime =
        tz.TZDateTime.from(scheduledTime, tz.local);
    await _notificationsPluginHelper.zonedSchedule(
        0,
        title,
        body,
        scheduledTZTime,
        //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
            //await scheduleDailyReminders();
  }



static Future scheduleDailyReminders() async {
  // Define the reminder times
  final DateTime now = DateTime.now();
  final DateTime breakfastTime = DateTime(now.year, now.month, now.day, 8, 0);  // 8 AM
  final DateTime lunchTime = DateTime(now.year, now.month, now.day, 12, 0);    // 1:10 PM
  final DateTime snackTime = DateTime(now.year, now.month, now.day, 16, 0);     // 4 PM
  final DateTime dinnerTime = DateTime(now.year, now.month, now.day, 19, 0);    // 7 PM

  // List of meal times
  List<Map<String, dynamic>> meals = [
    {"title": "Breakfast", "time": breakfastTime, "payload": "breakfast_payload"},
    {"title": "Lunch", "time": lunchTime, "payload": "lunch_payload"},
    {"title": "Snacks", "time": snackTime, "payload": "snacks_payload"},
    {"title": "Dinner", "time": dinnerTime, "payload": "dinner_payload"}
  ];

  // Iterate over meal times and attempt to schedule the next future notification
  for (var meal in meals) {
    DateTime scheduledTime = meal["time"];
    if (scheduledTime.isAfter(now)) {
      try {
        await scheduleNoti(
          title: 'REMINDER!!',
          body: 'It\'s time for ${meal["title"]}!',
          payload: meal["payload"],
          scheduledTime: scheduledTime,
        );
        // Stop after successfully scheduling the first future notification
        debugPrint('Scheduled ${meal["title"]} at $scheduledTime');
        break;  // Exit the loop after scheduling the next notification
      } catch (e) {
        debugPrint("Error scheduling ${meal["title"]}: $e");
        // Continue to the next meal if scheduling failed
      }
    } else {
      debugPrint('${meal["title"]} time has already passed: $scheduledTime');
    }
  }
}

}
