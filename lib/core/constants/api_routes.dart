class ApiRoutes {
  /// The url used to obtain the current user.
  static const String me = '/me';

  /// The url used to obtain all matches.
  static const String matches = 'matches';

  /// The url used to obtain an individual match by [id].
  static String matchById(String id) => 'matches/$id';
}
