import 'dart:async';
import 'dart:io';

import 'package:mailgw_client/mailgw_client.dart';

void main() async {
  GWAccount account = await MailGw.register();
  print('Send a message to the following address: $account');
  late StreamSubscription<GWMessage> subscription;
  subscription = account.messages.listen((event) async {
    print('Listened to message with id: $event');
    if (event.hasAttachments) {
      print('Message has following attachments:');
      event.attachments.forEach((e) async {
        print('- $e');
        File(e.name)
          ..create()
          ..writeAsBytes(await e.download());
      });
	}
	print('Test completed, everything went fine.');
    await subscription.cancel();
  });
}
