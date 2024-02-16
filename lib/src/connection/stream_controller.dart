import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class VStreamControllerOptions<T extends Equatable> extends Equatable {
  final io.Socket socket;
  final T Function(Map<String, dynamic> val) onValue;
  final String eventAndEmit;
  final dynamic data;

  const VStreamControllerOptions({
    required this.socket,
    required this.onValue,
    required this.eventAndEmit,
    this.data,
  });

  @override
  List<Object?> get props => [socket, onValue, eventAndEmit];
}

Stream<T?> vStreamController<T extends Equatable>(
    VStreamControllerOptions<T> options) async* {
  StreamController<T?> controller = StreamController();
  options.socket.on(options.eventAndEmit, (data) {
    controller.addStream(Stream.value(options.onValue(data)));
  });
  options.socket.emit(options.eventAndEmit, options.data);
  yield* controller.stream;
}

mixin StreamListener<W extends StatefulWidget> on State<W> {
  @protected
  void streamListener<T extends Equatable>(
      Stream<T?> stream, void Function(T? data) onData) {
    stream.listen((event) {
      log('StreamListener:');
      log(event?.toString() ?? 'No Data to Display');
      onData(event);
      if (mounted) setState(() {});
    });
  }
}
