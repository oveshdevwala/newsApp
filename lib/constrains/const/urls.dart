class Urls {
  // api Key
  static const apiKey = '&apiKey=3b4ccd9b270f4a938935d32e3ea53c20';
  // base URL
  static const baseUrl = 'https://newsapi.org/v2/';
  static const topHeadLineUrl = '${baseUrl}top-headlines?';
  static const publishedAt = '&sortBy=publishedAt';
  //Search
  static const english = '&language=en';
  static const everythingUrl = '${baseUrl}everything?';

  static const business = 'country=us&category=business';
  static const allCategory = 'country=us&category=general';
  static const health = 'country=us&q=health';
  static const sport = 'country=us&category=sports';
  static const science = 'country=us&category=science';
  static const technology = 'country=us&category=technology';
  static const entertainment = 'country=us&category=entertainment';
  static const recomandation = 'country=us';

  static String recommendationNews =
      '$topHeadLineUrl$recomandation$english$apiKey';
  static const searchNewsUrl = "${everythingUrl}q=";
  static const allNews = '$topHeadLineUrl$allCategory$english$apiKey';
  static const healthNews = '$topHeadLineUrl$health$english$apiKey';
  static const sportNews = '$topHeadLineUrl$sport$english$apiKey';
  static const scienceNews = '$topHeadLineUrl$science$english$apiKey';
  static const technologyNews = '$topHeadLineUrl$technology$english$apiKey';
  static const buisnessNews = '$topHeadLineUrl$business$english$apiKey';
  static const entertainmentNews =
      '$topHeadLineUrl$entertainment$english$apiKey';
}
