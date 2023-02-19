import 'dart:math';

String generateRandomString(int lengthOfString) {
  final random = Random();
  const allChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      // join is use for all the list value in a single string.
  final randomString = List.generate(lengthOfString, (index) => allChars[random.nextInt(allChars.length)]).join();
  return randomString;
}
