import 'dart:convert';

class UserModel {
  String id;
  String userName;
  String email;
  String gender;
  int level;
  String? password;
  String profileImage;
  bool isOnline;
  int createdAt;
  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.gender,
     this.level = 1,
    this.password,
    required this.profileImage,
    this.isOnline = false,
    required this.createdAt,
  });

  UserModel copyWith({
    String? id,
    String? userName,
    String? email,
    String? gender,
    int? level,
    String? password,
    String? profileImage,
    bool? isOnline,
    int? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      level: level ?? this.level,
      password: password ?? this.password,
      profileImage: profileImage ?? this.profileImage,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'userName': userName});
    result.addAll({'email': email});
    result.addAll({'gender': gender});
    result.addAll({'level': level});
    if(password != null){
      result.addAll({'password': password});
    }
    result.addAll({'profileImage': profileImage});
    result.addAll({'isOnline': isOnline});
    result.addAll({'createdAt': createdAt});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      level: map['level']?.toInt() ?? 0,
      password: map['password'],
      profileImage: map['profileImage'] ?? '',
      isOnline: map['isOnline'] ?? false,
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, email: $email, gender: $gender, level: $level, password: $password, profileImage: $profileImage, isOnline: $isOnline, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.userName == userName &&
      other.email == email &&
      other.gender == gender &&
      other.level == level &&
      other.password == password &&
      other.profileImage == profileImage &&
      other.isOnline == isOnline &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      gender.hashCode ^
      level.hashCode ^
      password.hashCode ^
      profileImage.hashCode ^
      isOnline.hashCode ^
      createdAt.hashCode;
  }

  static UserModel empty() {
    return UserModel(
      id: '',
      userName: '',
      email: '',
      password: '',
      profileImage: '',
      isOnline: false,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      level: 1,
      gender: ''
    );
  }
}
