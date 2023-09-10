class PublicationItem {
  PublicationItem({required json}) {
    title = json["title"];
    authorList = json["author"];
    publisher = json["publisher"];
    link = json["link"];
    abs = json["abstract"];
    year = json["year"];
  }

  late String title;
  late String authorList;
  late String publisher;
  late String link;
  late String abs;
  late int year;
}

List<PublicationItem> generateItems(List<dynamic> json) =>
    List<PublicationItem>.generate(
        json.length, (index) => PublicationItem(json: json[index]));
