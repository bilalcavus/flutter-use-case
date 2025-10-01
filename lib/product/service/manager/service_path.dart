
/// Project service path
enum ProductServicePath {
  userV1('/users'),
  usersV2('/v2/users');

  final String value;
  const ProductServicePath(this.value);

  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}