class User {
  String? name;

  String? uid;

  User({this.name, this.uid});

  factory User.fromMap(map) {
    return User(
      uid: map['uid'],
      name: map['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
    };
  }
}
