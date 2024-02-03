import 'package:encrypt/encrypt.dart';

class EncryptData {
  late Encrypter enc;

  void encInitialZer(){
    final key = Key.fromUtf8('wt8bscqfJ3xZLZKZdkYX6lHixZZptyccK8wNr/8h6jg=');
    enc = Encrypter(Salsa20(key));
  }

  String encrypt(String text){
    final iv = IV.fromUtf8('J3xZLZKZ');
    return enc.encrypt(text,iv: iv).base64;
  }

  String decrypt(String base64Text) {
    final iv = IV.fromUtf8('J3xZLZKZ');
    return enc.decrypt64(base64Text,iv: iv);
  }
}