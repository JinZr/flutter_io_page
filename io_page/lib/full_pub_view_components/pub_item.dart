

// stores ExpansionPanel state information
class PublicationItem {
  PublicationItem({required this.json}) {
    title = json["title"];
    authorList = json["author"];
    publisher = json["publisher"];
    link = json["link"];
  }

  dynamic json;

  late String title;
  late String authorList;
  late String publisher;
  late String link;
}

List<PublicationItem> generateItems(List<dynamic> json) {
  return List<PublicationItem>.generate(json.length, (int index) {
    return PublicationItem(json: json[index]);
  });
}
