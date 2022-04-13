import 'package:encrypt/encrypt.dart';

class SafeStorage {
  late final Encrypter _crypt;
  final IV _iv = IV.fromLength(16);
  final String passphrase;
  Map<String, String> illegalCharacters = {
    '<': '%%la%%',
    '>': '%%ra%%',
    ':': '%%dd%%',
    '"': '%%dq%%',
    '/': '%%rs%%',
    '\\': '%%ls%%',
    '|': '%%cs%%',
    '?': '%%qq%%',
    '*': '%%aa%%',
  };

  SafeStorage({required this.passphrase}) {
    Key passkey = Key.fromUtf8(this.passphrase);
    this._crypt = Encrypter(AES(passkey, mode: AESMode.ctr));
  }

  String _encryptInternal(String data) {
    Encrypted encData = this._crypt.encrypt(data, iv: this._iv);
    final String regexPattern = illegalCharacters.keys.join('|');
    print('encData is "${encData.toString()}", "${encData.base64}"');
    return encData.base64.replaceAllMapped(
      RegExp(r'$regexPattern'),
      (match) {
        print(match.groupCount);
        return illegalCharacters[match.group(0)] ?? '_asd_';
      },
    );
  }

  String _decryptInternal(String data) {
    final String regexPattern = illegalCharacters.values.join('|');
    print('reg: "$regexPattern"');
    final String cleanEncData = data.replaceAllMapped(
      RegExp(regexPattern, caseSensitive: true),
      (match) => illegalCharacters.keys.firstWhere(
        (k) => illegalCharacters[k] == match.group(0),
      ),
    );
    print('cleanEncData is "$cleanEncData"');
    return this
        ._crypt
        .decrypt(Encrypted.fromBase64(cleanEncData), iv: this._iv);
  }

  String encrypt(String key, String data) {
    final String encFilename = this._encryptInternal(key);
    return encFilename;
  }

  String decrypt(String key, String data) {
    final String encFilename = this._decryptInternal(key);
    return encFilename;
  }
}
