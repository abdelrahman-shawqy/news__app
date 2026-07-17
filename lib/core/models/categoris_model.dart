class CategorisModel {
  String id;
  String label;
  String image;

  CategorisModel({required this.id, required this.label, required this.image});

  static List<CategorisModel> getCategoris() {
    return [
      CategorisModel(
        id: "general",
        label: "General",
        image: "assets/images/general.png",
      ),
      CategorisModel(
        id: "business",
        label: "Business",
        image: "assets/images/business.png",
      ),
      CategorisModel(
        id: "sports",
        label: "Sports",
        image: "assets/images/sports.png",
      ),
      CategorisModel(
        id: "technology",
        label: "Technology",
        image: "assets/images/technology.png",
      ),
      CategorisModel(
        id: "entertainment",
        label: "Entertainment",
        image: "assets/images/"
            "entertainment.png",
      ),
      CategorisModel(
        id: "health",
        label: "Health",
        image: "assets/images/health.png",
      ),
      CategorisModel(
        id: "science",
        label: "Science",
        image: "assets/images/science.png",
      ),
    ];
  }
}
