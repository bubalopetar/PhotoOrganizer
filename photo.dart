class Photo {
  Photo(this.id, this.city, this.format, this.date);

  final String id;
  final String format;
  String sequence = '';
  final String date;
  final String city;

  factory Photo.fromString(String photoString) {
    // Function used to create Photo object from provided string.
    var data = photoString.split(', ');

    List idAndFormat = data[0].split('.');
    String id = idAndFormat[0];
    String format = idAndFormat[1];

    String city = data[1];
    String date = data[2];

    return Photo(id, city, format, date);
  }

  @override
  String toString() {
    return "$city$sequence.$format\n";
  }
}
