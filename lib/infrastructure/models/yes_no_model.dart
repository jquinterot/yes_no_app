// To parse this JSON data, do
//Model is where We convert a json or maps it into objects
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app/domain/entities/message.dart';

//String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

//Method to transform object into json object
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() =>
      Message(text: answer, fromWho: FromWho.hers, imageUrl: image);
}
