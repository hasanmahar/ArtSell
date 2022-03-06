import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  static List<Category> categories = [
    Category(
      name: 'Photography',
      imageUrl:
          'https://images.unsplash.com/photo-1548502499-ef49e8cf98d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGhvdG9ncmFwaHl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    ),
    Category(
      name: 'Art Work',
      imageUrl:
          'https://i.pinimg.com/564x/45/3c/90/453c90330f1316cc4b13d250e8008cfb.jpg',
    ),
    Category(
      name: 'Character Design Art',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/MYTQFKrgX9DmZh6EfhWDHn-970-80.jpg.webp',
    ),
  ];
}
