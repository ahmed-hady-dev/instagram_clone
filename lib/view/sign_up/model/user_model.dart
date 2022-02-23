class UserModel {
  String? name;
  String? uid;
  String? email;
  String? bio;
  String? photoUrl;
  List? followers;
  List? following;

  UserModel({
    this.name,
    this.uid,
    this.email,
    this.bio,
    this.photoUrl,
    this.followers,
    this.following,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    email = json['email'];
    bio = json['bio'];
    photoUrl = json['photoUrl'];
    followers = json['followers'];
    following = json['following'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['uid'] = uid;
    data['email'] = email;
    data['bio'] = bio;
    data['photoUrl'] = photoUrl;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}
