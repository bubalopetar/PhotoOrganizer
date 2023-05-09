import 'photo.dart';

class Organizer {
  Organizer(String photos) {
    _photosString = photos;
  }

  late String _photosString;
  Map<String, List<Photo>> _cityPhotos = {};
  List<Photo> _photos = [];

  String getOrganizedPhotos() {
    // Function used to organize photos from given string in multiple steps.

    _extractSinglePhotoStringsAndCreatePhotos();
    _sortCityPhotosByDate();
    _addSequenceToPhoto();
    return _createOrganizedPhotosString();
  }

  void _extractSinglePhotoStringsAndCreatePhotos() {
    // Function used to retrieve single Photo string from given full photos string
    // and send it to parsing to Photo class. Creates photos list and calls a function
    // that inserts photo in Map to coresponding city.

    _photosString.split('\n').forEach((photoString) {
      var photo = Photo.fromString(photoString);
      _photos.add(photo);
      _addPhotoToCity(photo);
    });
  }

  void _addPhotoToCity(Photo photo) {
    // Function used to add photo to array in Map under the "city name" key or create
    // a new "city name" key with photo element in value list.

    _cityPhotos.containsKey(photo.city)
        ? _cityPhotos[photo.city]!.add(photo)
        : _cityPhotos[photo.city] = [photo];
  }

  _sortCityPhotosByDate() {
    // Sort photos for each key in _cityPhotos by photo date.

    _cityPhotos.values.forEach((photos) {
      photos.sort(
        (a, b) => a.date.compareTo(b.date),
      );
    });
  }

  void _addSequenceToPhoto() {
    // Calculate sequence and set it for each photo.

    _cityPhotos.forEach((city, photos) {
      int photosCountLength = photos.length.toString().length;
      photos.asMap().forEach((index, photo) {
        index++;
        photo.sequence = index.toString().padLeft(photosCountLength, '0');
      });
    });
  }

  String _createOrganizedPhotosString() {
    // Create string with all photos to return to user based on each Photo.toString() method.
    var photosOrganized = '';

    _photos.forEach((photo) {
      photosOrganized += photo.toString();
    });
    return photosOrganized;
  }
}
