class UserDataLeaderbord {
  String name = '---';
  int steps = 0;
  String urlImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";

  UserDataLeaderbord({
    required this.steps,
  });
  UserDataLeaderbord.all({
    required this.name,
    required this.steps,
    required this.urlImage,
  });

  void insertNameAndUrlImage(String name, String urlImage) {
    this.name = name;
    this.urlImage = urlImage;
  }
}
