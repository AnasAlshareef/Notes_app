
// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  String? title;
  String? content;
  Note( {
    this.title,
    this.content,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json["title"],
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "content": this.content,
  };
  }


}
