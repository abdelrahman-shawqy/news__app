class ArticlesModel {
  String author;

  String description;

  String urlToImage;

  String publishedAt;


  ArticlesModel(
      {required this.author, required this.publishedAt, required this.description, required this.urlToImage,});

  static List<ArticlesModel>get articlesGet=>
  [
  ArticlesModel(description: "40-year-old man falls 200 feet to his death while canyoneering at national park",author: "Jon Haworth ",publishedAt: "15 minutes ago",urlToImage: "assets/images/Articles_1.png"),
  ArticlesModel(description: "40-year-old man falls 200 feet to his death while canyoneering at national park",author: "Jon Haworth ",publishedAt: "15 minutes ago",urlToImage: "assets/images/Articles_1.png"),
  ArticlesModel(description: "40-year-old man falls 200 feet to his death while canyoneering at national park",author: "Jon Haworth ",publishedAt: "15 minutes ago",urlToImage: "assets/images/Articles_1.png"),
  ArticlesModel(description: "40-year-old man falls 200 feet to his death while canyoneering at national park",author: "Jon Haworth ",publishedAt: "15 minutes ago",urlToImage: "assets/images/Articles_1.png"),
  ArticlesModel(description: "40-year-old man falls 200 feet to his death while canyoneering at national park",author: "Jon Haworth ",publishedAt: "15 minutes ago",urlToImage: "assets/images/Articles_1.png"),
  ];
}