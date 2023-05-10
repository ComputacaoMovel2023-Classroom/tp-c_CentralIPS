import 'package:firebase_database/firebase_database.dart';

class CentralDB {
  static final CentralDB _singleton = CentralDB._internal();
  DatabaseReference? _databaseReference;

  factory CentralDB() {
    return _singleton;
  }

  CentralDB._internal() {
    // Initialize Firebase database instance
    //Firebase.initializeApp();
    _databaseReference ??= FirebaseDatabase.instance.ref();
  }

  DatabaseReference? get databaseReference {
    return _databaseReference;
  }
}
