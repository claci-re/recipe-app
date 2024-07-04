class Resep {
  final String title;
  final String description;
  final String ingredients;
  final String steps;
  final String image;
  final String author;
  final double rating;

  Resep({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.image,
    required this.author,
    required this.rating,
  });

  // Factory constructor untuk membuat instance Resep dari map (misalnya dari JSON)
  factory Resep.fromMap(Map<String, dynamic> map) {
    return Resep(
      title: map['title'],
      description: map['description'],
      ingredients: map['ingredients'],
      steps: map['steps'],
      image: map['image'],
      author: map['author'],
      rating: map['rating'],
    );
  }

  // Method untuk mengubah instance Resep menjadi map (misalnya untuk konversi ke JSON)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'image': image,
      'author': author,
      'rating': rating,
    };
  }
}
