class ApiBase {
  static final ApiBase _instance = ApiBase.init();
  static ApiBase get instance => _instance;
  ApiBase.init();

  final String users = 'https://jsonplaceholder.typicode.com/users';
  final String products = 'https://simplebeckend.herokuapp.com/api/products';
}
