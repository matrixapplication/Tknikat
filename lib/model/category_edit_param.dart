import 'dart:io';

class CategoryEditParam{
  final int id;
  final String title;
  final File? image;

  CategoryEditParam({required this.id, required this.title, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'cover': this.image,
    };
  }

}