class HttpException {
  String? massage;

  HttpException({this.massage});

@override
  String toString() {
    // TODO: implement toString
    return massage!;
  }
}