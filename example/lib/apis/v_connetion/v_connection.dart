import 'package:example/data/dto/basic_info.dart';
import 'package:example/data/dto/info.dart';
import 'package:example/data/dto/update_exists.dart';
import 'package:vdlib/vdlib.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

Stream<BasicInfoDto?> getBasicInfo(io.Socket socket) async* {
  yield* vStreamController<BasicInfoDto>(
    VStreamControllerOptions(
      onValue: BasicInfoDto.fromJson,
      socket: socket,
      eventAndEmit: 'basic_info',
    ),
  );
}

Stream<UpdateExists?> updateExists(io.Socket socket) async* {
  yield* vStreamController<UpdateExists>(
    VStreamControllerOptions(
      onValue: UpdateExists.fromJson,
      socket: socket,
      eventAndEmit: 'update_exists',
    ),
  );
}

Stream<InfoDto?> getInfo(io.Socket socket, String key) async* {
  yield* vStreamController<InfoDto>(
    VStreamControllerOptions(
      socket: socket,
      onValue: InfoDto.fromJson,
      eventAndEmit: 'get_info',
      data: key,
    ),
  );
}
