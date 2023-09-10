// stores ExpansionPanel state information
class PublicationItem {
  PublicationItem({required this.json}) {
    title = json["title"];
    authorList = json["author"];
    publisher = json["publisher"];
    link = json["link"];
    year = json["year"];
    abs = json["abstract"];
  }

  dynamic json;

  late String title;
  late String authorList;
  late String publisher;
  late String link;
  late String abs;
  late int year;
}

List<PublicationItem> generateItems(List<dynamic> json) =>
    List<PublicationItem>.generate(
        json.length, (int index) => PublicationItem(json: json[index]));
