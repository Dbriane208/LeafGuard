class PredictionResponse {
  final String predictedClass;
  final double confidence;
  final String symptoms;
  final String measures;

  PredictionResponse({
    required this.predictedClass,
    required this.confidence,
    required this.symptoms,
    required this.measures
  });

  // Factory method to create an instance from JSON
  factory PredictionResponse.fromJson(Map<String, dynamic> json){
    return PredictionResponse(
      predictedClass: json['class'],
      confidence: (json['confidence'] as num).toDouble(),
      symptoms: json['symptoms'],
      measures: json['measures']
    );
  }
}