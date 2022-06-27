extension TimeStamp on double {
  // recieve date string from timestamp
  String dateFromTimeStamp() {
    final date = DateTime.fromMillisecondsSinceEpoch(this.toInt() * 1000);
    String month = date.month.toString();
    if(date.month < 10){
    month = "0${date.month}";
  }
    return "${date.day} $month";
  }
}
