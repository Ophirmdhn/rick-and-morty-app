abstract class Endpoint {
  static const String baseUrl = "https://rickandmortyapi.com/api";
  
  static String getAllUser(int page) => "$baseUrl/character?page=$page";
}