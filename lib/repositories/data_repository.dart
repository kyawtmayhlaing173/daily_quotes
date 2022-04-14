import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('quotes');
}
