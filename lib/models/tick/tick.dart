import 'package:json_annotation/json_annotation.dart';

part 'tick.g.dart';

@JsonSerializable()
class Tick {
  final double? ask;
  final double? bid;
  final double? quote;

  final String? id;

  Tick(this.ask, this.bid, this.id, this.quote);

  factory Tick.fromJson(Map<String, dynamic> json) => _$TickFromJson(json);
  Map<String, dynamic> toJson() => _$TickToJson(this);
}
