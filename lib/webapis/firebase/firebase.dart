import 'package:chat_app1/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<UserModel>> fetchUsers() async {
  List<UserModel> users = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var querySnapshot = await firestore.collection('users').get();
  var list = querySnapshot.docs;
  for (var doc in list) {
    var uid = doc.id;
    Map<String, dynamic> map = doc.data();
    UserModel model = UserModel.fromJson(map);
    users.add(model);
  }
  return Future(() => users);
}
