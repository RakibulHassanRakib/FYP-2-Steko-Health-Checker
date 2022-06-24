class NewUser {
  String uid;
  String name;
  String email;
  String phone;

  NewUser({this.uid, this.name, this.email});

  //send data to Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': uid,
      'userName': name,
      'userEmail': email,
    };
  }

  factory NewUser.fromFirestore(Map<String, dynamic> firestore) => NewUser(
        uid: firestore['userId'],
        email: firestore['userEmail'] ?? " ",
        name: firestore['userName'] ?? " ",
      );
}
