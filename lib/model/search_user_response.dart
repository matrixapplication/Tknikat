class SearchUserResponse {
  String? result;
  List<SearchUserResponseContent>? content;

  SearchUserResponse(
      {this.result,
        this.content,
   });

  SearchUserResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['content'] != null && json['content'] is List) {
      content = <SearchUserResponseContent>[];
      json['content'].forEach((v) {
        content!.add(new SearchUserResponseContent.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class SearchUserResponseContent {
  int? id;


  String? title;


  SearchUserResponseContent(
      {this.id,

        this.title,
        });

  SearchUserResponseContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    title = json['name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    return data;
  }
}

class Paginator {
  int? totalCount;
  int? limit;
  int? totalPage;
  int? currentPage;

  Paginator({this.totalCount, this.limit, this.totalPage, this.currentPage});

  Paginator.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    limit = json['limit'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['limit'] = this.limit;
    data['total_page'] = this.totalPage;
    data['current_page'] = this.currentPage;
    return data;
  }
}
