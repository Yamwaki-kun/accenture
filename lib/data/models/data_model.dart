class DataModel {
  final String title;
  final String imageURL;
  final String description;
  final int itemId;

  DataModel(
      {required this.title, required this.imageURL, required this.itemId, required this.description});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        title: json['name'],
        imageURL: json['avatar'],
        description: json['description'],
        itemId: int.parse(json['id']));
  }
}
