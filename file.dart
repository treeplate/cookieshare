#!/home/treeplate/bin/dart-sdk/bin/dart
// (the cgi file used on my server)

import 'dart:io';

void main() async {
  try {
  int proj2 = 2284;

  String cookie2 = '_flavortown_session_v2=COOKIE2';

  HttpClient client = HttpClient();
  HttpClientRequest request = await client.getUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-2276', true);
  request.headers.set(
    'cookie',
    '_flavortown_session_v2=COOKIE1',
  );
  print((await request.close()).statusCode);
  request = await client.getUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-2276', true);
  request.headers.set(
    'cookie',
    cookie2,
  );
  print((await request.close()).statusCode);
  request = await client.getUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-$proj2', true);
  request.headers.set(
    'cookie',
    '_flavortown_session_v2=COOKIE1',
  );
  print((await request.close()).statusCode);
  request = await client.getUrl(
    Uri.parse('https://flavortown.hackclub.com/projects'),
  );
  request.headers.set('X-Flavortown-Ext-$proj2', true);
  request.headers.set(
    'cookie',
    cookie2,
  );
  print((await request.close()).statusCode);
  exit(0);
  } catch(e) {
    print('meow $e');
  }
}
