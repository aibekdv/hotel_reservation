import 'package:dio/dio.dart';
import 'package:reservetion/core/error/exception.dart';
import 'package:reservetion/feature/data/models/models.dart';

abstract class RemoteDataSource {
  Future<HotelModel> getHotel();
  Future<List<RoomModel>> getRooms();
  Future<ReservationModel> getReservation();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<HotelModel> getHotel() async {
    try {
      final response = await dio.get("/35e0d18e-2521-4f1b-a575-f0fe366f66e3");

      if (response.statusCode == 200) {
        return HotelModel.fromJson(response.data);
      } else {
        print(response);
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<ReservationModel> getReservation() async {
    try {
      final response = await dio.get("/e8868481-743f-4eb2-a0d7-2bc4012275c8");

      if (response.statusCode == 200) {
        return ReservationModel.fromJson(response.data);
      } else {
        print(response);
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }

  @override
  Future<List<RoomModel>> getRooms() async {
    try {
      final response = await dio.get("/f9a38183-6f95-43aa-853a-9c83cbb05ecd");

      if (response.statusCode == 200) {
        List rooms = response.data['rooms'];
        return rooms.map((e) => RoomModel.fromJson(e)).toList();
      } else {
        print(response);
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
