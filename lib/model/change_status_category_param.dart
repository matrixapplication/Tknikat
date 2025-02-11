class ChangeStatusCategoryParam {
  final int categoryId;
  final String status;
  final List<int>? userIds;

  ChangeStatusCategoryParam({
    required this.categoryId,
    required this.status,
    this.userIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'category_id': categoryId,
      'status': status,
    };

    // Dynamically add users with keys like 'users[0]', 'users[1]', etc.
    if (userIds != null) {
      for (int i = 0; i < userIds!.length; i++) {
        json['users[$i]'] = userIds![i];
      }
    }

    return json;
  }
}
