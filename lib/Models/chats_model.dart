class MessageClass {
  final String username;
  final String time;
  final String mssg;
  final bool isOnline;

  MessageClass({this.username, this.time, this.mssg, this.isOnline});
}

List messageList = [
  MessageClass(
      username: "User 1",
      time: "9.00 AM",
      mssg: "hello hw r u",
      isOnline: true),
  MessageClass(
      username: "User 2",
      time: "11.00 AM",
      mssg: "Do share your thoughts on today's group talk. Its a safe place :)",
      isOnline: false),
  MessageClass(
      username: "User 3",
      time: "12.00 PM",
      mssg: "hello hw r u",
      isOnline: false),
  MessageClass(
      username: "User 4",
      time: "8.00 PM",
      mssg: "hello hw r u",
      isOnline: true),
];
