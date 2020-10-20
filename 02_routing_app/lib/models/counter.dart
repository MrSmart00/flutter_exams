import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'counter.freezed.dart';

@freezed
abstract class Counter with _$Counter {
  factory Counter({
    @required int count,
    @required bool enabled,
    @required Color color,
    @required String text,
    @required Icon buttonIcon,
  }) = _counter;
}