import 'dart:math';

import 'package:crypt/crypt.dart';
import 'package:nanoid/nanoid.dart';

class Security {
  static String hash({
    required String value,
    String? salt,
  }) {
    return Crypt.sha512(value, salt: salt).hash;
  }

  static String generateUID({int size = 32}) {
    return nanoid(size);
  }

  static int generateIntegerUID({int? size}) {
    Random rand = Random();

    if (size == null) {
      return rand.nextInt(6);
    } else {
      return rand.nextInt(size);
    }
  }
}
