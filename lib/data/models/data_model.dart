class DataModel {
  final String title;
  final String imageURL;
  final int itemId;

  DataModel(
      {required this.title, required this.imageURL, required this.itemId});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        title: json['name'],
        imageURL: json['avatar'],
        itemId: int.parse(json['id']));
  }
}
