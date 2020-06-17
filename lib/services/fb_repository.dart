import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository {
  final CollectionReference collection = Firestore.instance.collection('notificacao');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<void> saveDocument(Map<String, dynamic> data) async {
    return collection.add(data);
  }

  Future<void> deleteDocument(String id) async {
    return collection.document(id).delete();
  }
}