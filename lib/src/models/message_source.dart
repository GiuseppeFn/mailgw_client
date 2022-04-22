GWMessageSource messageSourceFromJson(Map<String, dynamic> json) =>
    GWMessageSource._fromJson(json);

class GWMessageSource {
  /// The id of the message.
  final String id;

  /// Message download url
  final String url;

  /// Message data
  final String data;

  GWMessageSource._({
    required this.id,
    required this.url,
    required this.data,
  });

  factory GWMessageSource._fromJson(
    Map<String, dynamic> json,
  ) =>
      GWMessageSource._(
        id: json['id'],
        url: json['downloadUrl'],
        data: json['data'],
      );

  @override
  String toString() => data;
}
