class LogModel {
  String userId;
  String action;
  String time;

  LogModel(this.userId, this.action, this.time);

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "action": action,
    "time": time,
  };
}