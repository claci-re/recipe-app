import 'resep.dart';

class User {
  final String name;
  final String email;
  final String password;
  final List<Resep> likedRecipes;
  final List<Resep> createdRecipes;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.likedRecipes,
    required this.createdRecipes,
  });

  // Factory constructor untuk membuat instance User dari map (misalnya dari JSON)
  factory User.fromMap(Map<String, dynamic> map) {
    var likedRecipesFromMap = (map['likedRecipes'] as List)
        .map((item) => Resep.fromMap(item))
        .toList();
    var createdRecipesFromMap = (map['createdRecipes'] as List)
        .map((item) => Resep.fromMap(item))
        .toList();

    return User(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      likedRecipes: likedRecipesFromMap,
      createdRecipes: createdRecipesFromMap,
    );
  }

  // Method untuk mengubah instance User menjadi map (misalnya untuk konversi ke JSON)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'likedRecipes': likedRecipes.map((recipe) => recipe.toMap()).toList(),
      'createdRecipes': createdRecipes.map((recipe) => recipe.toMap()).toList(),
    };
  }
}
