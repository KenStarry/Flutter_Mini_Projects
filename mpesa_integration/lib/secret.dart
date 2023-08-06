class Secret {
  final String consumerKey;
  final String consumerSecret;

  Secret({required this.consumerKey, required this.consumerSecret});

  factory Secret.fromJson(Map<String, dynamic> json) => Secret(
      consumerKey: json['consumer-key'],
      consumerSecret: json['consumer-secret']);
}
