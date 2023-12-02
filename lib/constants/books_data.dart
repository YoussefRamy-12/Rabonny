class BookData {

String imgPath;
  String bookName;
  String bookPushNamed;
  static int index=0;
  BookData({required this.bookName,required this.bookPushNamed,required this.imgPath}) {
    index++;
  }

}