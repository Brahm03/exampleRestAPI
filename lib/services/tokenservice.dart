class TokenService {
  static final TokenService _instance = TokenService.init();
  static TokenService get instance => _instance;
  TokenService.init();

  bool isExpered = false;
  late DateTime expirationDate;
}
