import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Notifications extends StatefulWidget {
  static const String routname = "Notifications";
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  // List to store received notifications
  List<Map<String, String>> notifications = [];

  getToken() async {
    String? myToken = await messaging.getToken();
    print("=====================================");
    print("FCM Token: $myToken");
  }

  myRequestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  void initState() {
    super.initState();
    myRequestPermission();
    getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        String title = message.notification!.title ??
            AppLocalizations.of(context)!.noTitle;
        String body =
            message.notification!.body ?? AppLocalizations.of(context)!.noBody;
        showNotificationDetails({"title": title, "body": body});
        setState(() {
          notifications.insert(0, {"title": title, "body": body});
        });
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        String title = message.notification!.title ??
            AppLocalizations.of(context)!.noTitle;
        String body =
            message.notification!.body ?? AppLocalizations.of(context)!.noBody;

        showNotificationDetails({"title": title, "body": body});
        setState(() {
          notifications.insert(0, {"title": title, "body": body});
        });
      }
    });

    messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null && message.notification != null) {
        String title = message.notification!.title ??
            AppLocalizations.of(context)!.noTitle;
        String body =
            message.notification!.body ?? AppLocalizations.of(context)!.noBody;

        showNotificationDetails({"title": title, "body": body});
        setState(() {
          notifications.insert(0, {"title": title, "body": body});
        });
      }
    });
  }

  void showNotificationDetails(Map<String, String> notification) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ThemingColor.darkGrayColor,
          title: Text(notification["title"]!),
          content: Text(notification["body"]!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.notifications)),
      body: notifications.isEmpty
          ? Center(
              child: Text(AppLocalizations.of(context)!.noNotificationsYet))
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  color: ThemingColor.darkGrayColor,
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ThemingColor.lightGrayColor, width: 1)),
                    child: ListTile(
                      onTap: () =>
                          showNotificationDetails(notifications[index]),
                      title: Text(
                        notifications[index]["title"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(notifications[index]["body"]!),
                      leading: Icon(Icons.notifications),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
