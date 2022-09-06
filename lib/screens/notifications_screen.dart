import 'package:flutter/material.dart';
import 'package:remote_notifications/models/remote_notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  final List<RemoteNotification> _remote_notifications = const [
    RemoteNotification("Boat Name", "shore alarm", "shore power lost",
        "assets/images/noti.jpg"),
    RemoteNotification("Boat Name", "gen alarm", "port gent start fail",
        "assets/images/noti.jpg"),
    RemoteNotification(
        "Boat Name", "blackout", "vessel lost power", "assets/images/noti.jpg"),
    RemoteNotification("Boat Name", "mierda en papel", "transfer failure",
        "assets/images/noti.jpg"),
    RemoteNotification("Boat Name", "device unreachable", "lost connection",
        "assets/images/noti.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: ListView.builder(
          itemCount: _remote_notifications.length,
          itemBuilder: (context, index) {
            return ListItemRemoteNotification(_remote_notifications[index]);
          }),
    );
  }
}

class ListItemRemoteNotification extends StatelessWidget {
  final RemoteNotification _remote_notification;
  const ListItemRemoteNotification(this._remote_notification, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Image.asset(
                    _remote_notification.coverUrl,
                    width: 90,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(_remote_notification.source,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 18))),
                      const SizedBox(height: 5),
                      Flexible(
                          child: Text(_remote_notification.title,
                              style: Theme.of(context).textTheme.subtitle2)),
                      const SizedBox(height: 5),
                      Flexible(
                          child: Text(_remote_notification.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
