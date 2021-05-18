class District {
  final int totalConfirmedCases;
  final int totalActiveCases;
  final int totalRecoveredCases;
  final int totalDeceasedCases;
  final int todayConfirmedCases;
  final int todayRecoveredCases;
  final int todayDeceasedCases;

  District(
      this.totalConfirmedCases,
      this.totalActiveCases,
      this.totalRecoveredCases,
      this.totalDeceasedCases,
      this.todayConfirmedCases,
      this.todayRecoveredCases,
      this.todayDeceasedCases);

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      json['Karnataka']['districtData']['Udupi']['confirmed'] as int,
      json['Karnataka']['districtData']['Udupi']['active'] as int,
      json['Karnataka']['districtData']['Udupi']['recovered'] as int,
      json['Karnataka']['districtData']['Udupi']['deceased'] as int,
      json['Karnataka']['districtData']['Udupi']['delta']['confirmed'] as int,
      json['Karnataka']['districtData']['Udupi']['delta']['recovered'] as int,
      json['Karnataka']['districtData']['Udupi']['delta']['deceased'] as int,
    );
  }
}
