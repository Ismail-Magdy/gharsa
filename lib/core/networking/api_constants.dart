class ApiConstants {
  // Private constructor
  ApiConstants._();

  // TODO: Move to .env file later for better security and flexibility
  static const String apiBaseUrl = "https://agricommerce.runasp.net/api/";

  /// Auth
  static const String apiLogin = "Account/login";
  static const String apiSignup = "Account/register";

  /// Products & Categories
  static const String apiBestSellerProducts = "Product";
  static const String apiSearchProducts = "Product";
  static const String apiAllCategories = "Category";
  static const String apiCategoryProducts = "Product";
  static const String apiProductDetails = "Product";

  /// Orders
  static const String apiNewOrder = "Order";
}
