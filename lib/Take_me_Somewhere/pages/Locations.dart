import 'package:flutter/material.dart';

class Location {
  final int id;
  final String name;
  final String description;
  final String location;
  final String image;
  final double rating;

  Location({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.image,
    required this.rating,
  });
}

// demo places

List<Location> demoLocations = [
  Location(
      id: 1,
      name: 'Freedom Park',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Bengaluru, karnataka',
      image: 'assets/images/freedom_park.jpg',
      rating: 4),
  Location(
      id: 2,
      name: 'Jawaharlal Nehru Planeterium',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Bengaluru, karnataka',
      image: 'assets/images/jawaharlal_nehru.jpg',
      rating: 3),
  Location(
      id: 3,
      name: 'Karnataka Chitrakala Parishat',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Bengaluru, karnataka',
      image: 'assets/images/kar_chit_paris.jpg',
      rating: 5),
  Location(
      id: 4,
      name: 'Orion Mall',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
      location: 'Bengaluru, karnataka',
      image: 'assets/images/orion_mall.jpg',
      rating: 3),
];
