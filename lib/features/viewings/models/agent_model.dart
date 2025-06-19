class AgentModel {
  AgentModel({
    required this.profile,
    required this.rating,
    required this.reviews,
    required this.activeListings,
    required this.name,
    required this.position,
  });

  final String name;
  final String position;
  final String profile;
  final double rating;
  final int reviews;
  final int activeListings;
}
