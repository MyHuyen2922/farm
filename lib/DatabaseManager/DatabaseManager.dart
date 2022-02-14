import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');

  Future<void> createUserData(String name, String phone, String uid) async {
    return await profileList.doc(uid).set({'name': name, 'phone': phone});
  }

  Future getUserList() async {
    List itemsList = [];
    try {
      await profileList.get().then(((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      }));
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
