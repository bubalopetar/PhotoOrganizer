# Photos

Dart script used for organizing photos.

## Clone project

```bash
gh repo clone bubalopetar/PhotoOrganizer
```

## Usage

```dart
import 'organizer.dart';

String photos = """DSC012333.jpg, Madrid, 2016-10-01 13:02:34
DSC044322.jpg, Milan, 2015-03-05 10:11:22
DSC130033.raw, Rio, 2018-06-02 17:01:30
DSC044322.jpeg, Milan, 2015-03-04 14:55:01
DSC130033.jpg, Rio, 2018-06-02 17:05:10
DSC012335.jpg, Milan, 2015-03-05 10:11:24""";

// instantiate Organizer class and provide photos string to its constructor
Organizer organizer = Organizer(photos);

// call organizer.getOrganizedPhotos() method to retrieve organized photos string
print(organizer.getOrganizedPhotos());
```

## Run script

```bash
dart main.dart
```