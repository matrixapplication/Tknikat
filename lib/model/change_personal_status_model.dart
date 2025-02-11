class ChangeStatusParams{
   String keyValue;
   String statusValue;

  ChangeStatusParams({required this.keyValue,required this.statusValue});

  Map<String, dynamic> toMap() {
    return {
      'key': this.keyValue,
      'status': this.statusValue,
    };
  }

  factory ChangeStatusParams.fromMap(Map<String, dynamic> map) {
    return ChangeStatusParams(
      keyValue: map['key'] as String,
      statusValue: map['status'] as String,
    );
  }
}