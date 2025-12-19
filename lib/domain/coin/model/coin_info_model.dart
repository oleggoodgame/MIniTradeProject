class CoinInfo {
  final String name;
  final String description;
  final String logo;
  final String website;
  final DateTime? dateLaunched;

  final double? maxSupply;
  final double? marketCap;
  final double? marketCapDominance;
  final DateTime? lastUpdated;

  CoinInfo({
    required this.name,
    required this.description,
    required this.logo,
    required this.website,
    required this.dateLaunched,
    this.maxSupply,
    this.marketCap,
    this.marketCapDominance,
    this.lastUpdated,
  });

  // factory для JSON з /v2/info
  factory CoinInfo.fromInfoJson(Map<String, dynamic> json) {
    return CoinInfo(
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      website: (json['urls'] != null && (json['urls']['website'] as List).isNotEmpty)
          ? json['urls']['website'][0]
          : '',
      dateLaunched: json['date_added'] != null
          ? DateTime.parse(json['date_added'])
          : null,
    );
  }

  // factory для JSON з /v1/quotes/latest
  CoinInfo copyWithQuoteJson(Map<String, dynamic> quoteJson) {
    final usdQuote = quoteJson['quote']?['USD'];
    return CoinInfo(
      name: name,
      description: description,
      logo: logo,
      website: website,
      dateLaunched: dateLaunched,
      maxSupply: usdQuote != null ? (quoteJson['max_supply'] as num?)?.toDouble() : null,
      marketCap: usdQuote != null ? (usdQuote['market_cap'] as num?)?.toDouble() : null,
      marketCapDominance: usdQuote != null ? (usdQuote['market_cap_dominance'] as num?)?.toDouble() : null,
      lastUpdated: usdQuote != null && usdQuote['last_updated'] != null
          ? DateTime.parse(usdQuote['last_updated'])
          : null,
    );
  }
}
