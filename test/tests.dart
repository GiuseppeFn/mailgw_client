import 'package:mailgw_client/mailgw_client.dart';
import 'package:test/test.dart';

void main() async {
  tearDown(() async => await Future.delayed(Duration(seconds: 1)));
  late GWAccount account;

  test('Domains', () => expect(GWDomain.domains, completes));

  group('MailGw tests -', () {
    test('Register', () async => account = await MailGw.register());
    test('Login', () async => account = await MailGw.login(id: account.id));
  });

  group('Account class -', () {
    test('Update', () => expect(account.update(), completes));
    test('Delete', () => expect(account.delete(), completion(true)));
  });
}
