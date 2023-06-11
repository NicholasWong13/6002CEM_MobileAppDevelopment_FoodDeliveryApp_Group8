import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = "/inboxScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Inbox'),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MessageTile(
            sender: 'John Doe',
            subject: 'Important Notice',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '10:30 AM',
          ),
          MessageTile(
            sender: 'Jane Smith',
            subject: 'Meeting Reminder',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: 'Yesterday',
          ),
          MessageTile(
            sender: 'David Johnson',
            subject: 'New Offer',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '2 days ago',
          ),
          MessageTile(
            sender: 'John Doe',
            subject: 'Important Notice',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '10:30 AM',
          ),
          MessageTile(
            sender: 'Jane Smith',
            subject: 'Meeting Reminder',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: 'Yesterday',
          ),
          MessageTile(
            sender: 'David Johnson',
            subject: 'New Offer',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '2 days ago',
          ),
          MessageTile(
            sender: 'John Doe',
            subject: 'Important Notice',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '10:30 AM',
          ),
          MessageTile(
            sender: 'Jane Smith',
            subject: 'Meeting Reminder',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: 'Yesterday',
          ),
          MessageTile(
            sender: 'David Johnson',
            subject: 'New Offer',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '2 days ago',
          ),
          MessageTile(
            sender: 'John Doe',
            subject: 'Important Notice',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '10:30 AM',
          ),
          MessageTile(
            sender: 'Jane Smith',
            subject: 'Meeting Reminder',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: 'Yesterday',
          ),
          MessageTile(
            sender: 'David Johnson',
            subject: 'New Offer',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            time: '2 days ago',
          ),
          // Add more message tiles here
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String sender;
  final String subject;
  final String message;
  final String time;

  const MessageTile({
    Key key,
    @required this.sender,
    @required this.subject,
    @required this.message,
    @required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(sender[0]),
        ),
        title: Text(
          sender,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Text(time),
      ),
    );
  }
}
