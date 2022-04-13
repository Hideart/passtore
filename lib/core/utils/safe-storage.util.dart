import 'package:encrypt/encrypt.dart';

class SafeStorage {
  late final Encrypter _crypt;
  final IV _iv = IV.fromLength(16);
  final String passphrase;

  SafeStorage({required this.passphrase}) {
    Key passkey = Key.fromUtf8(this.passphrase);
    this._crypt = Encrypter(AES(passkey, mode: AESMode.ctr));
  }

  String encrypt(String data) {
    return this._crypt.encrypt(data, iv: this._iv).base64;
  }

  String decrypt(String data) {
    return this._crypt.decrypt(Encrypted.fromBase64(data), iv: this._iv);
  }
}
