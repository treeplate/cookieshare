#!/home/treeplate/bin/dart-sdk/bin/dart
// (the cgi file used on my server)

import 'dart:io';

void main() async {
  int proj2 = int.parse(stdin.readLineSync()!);

  String cookie2 = stdin.readLineSync()!;

  HttpClient client = HttpClient();
  HttpClientRequest request = await client.postUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-2276', true);
  request.headers.set(
    'cookie',
    cookie2,
  );
  await request.close();
  request = await client.postUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-$proj2', true);
  request.headers.set(
    'cookie',
    'REDACTED',
  );
  await request.close();
  request = await client.postUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-$proj2', true);
  request.headers.set(
    'cookie',
    cookie2,
  );
}
