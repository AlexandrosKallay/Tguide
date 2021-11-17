import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  String preview;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
    required this.preview,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/temple.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/swing.jpg',
    name: 'Walking Tour and swing Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/beach.jpg',
    name: 'beach Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/bali.jpg',
    city: 'Bali',
    country: 'Indonesia',
    description: 'Visit Bali for an amazing and unforgettable adventure.',
    preview:'Bali is a province of Indonesia and the westernmost of the Lesser Sunda Islands. \n'
        'East of Java and west of Lombok, the province includes the island of Bali and a few \nsmaller neighbouring islands,'
        'notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan. The provincial capital, Denpasar, \n'
        'is the most populous city in the Lesser Sunda Islands and the second-largest, after Makassar, in Eastern Indonesia. \n'
        'Bali is Indonesia''s main tourist destination, with a significant rise in tourism since the 1980s. Tourism-related business makes up 80% of its economy.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/santorini.jpg',
    city: 'Santorini',
    country: 'Greece',
    description: 'Visit Santorini for an amazing and unforgettable adventure.',
    preview:'test preview2',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/canaria.jpg',
    city: 'Gran Canaria',
    country: 'Spain',
    description: 'Visit New Gran Canaria for an amazing and unforgettable adventure.',
    preview:'test preview3',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/majorca.jpg',
    city: 'Majorca',
    country: 'Spain',
    description: 'Visit Majorca for an amazing and unforgettable adventure.',
    preview:'test preview4',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/Thailand.jpg',
    city: 'Bangkok',
    country: 'Thailand',
    description: 'Visit Bangkok for an amazing and unforgettable adventure.',
    preview:'test preview5',
    activities: activities,
  ),
];