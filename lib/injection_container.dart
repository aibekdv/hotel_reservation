// GET_IT INSTANCE
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservetion/feature/data/repositories/hotel_repository_impl.dart';
import 'package:reservetion/feature/domain/repositories/repositories.dart';
import 'package:reservetion/feature/domain/usecases/get_hotel_usecase.dart';
import 'package:reservetion/feature/domain/usecases/get_reservation_usecase.dart';
import 'package:reservetion/feature/domain/usecases/get_rooms_usecase.dart';
import 'package:reservetion/feature/presentation/cubit/hotel_cubit.dart';

import 'feature/data/datasources/datasources.dart';

final sl = GetIt.instance;

// DEPENDENCY INJECTION
Future<void> init() async {
  // CUBIT (BLOC)

  sl.registerFactory(
    () => HotelCubit(
      getHotelUseCase: sl(),
      getReservationUseCase: sl(),
      getRoomsUseCase: sl(),
    ),
  );

  // USECASES
  sl.registerLazySingleton(() => GetHotelUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetReservationUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetRoomsUseCase(repository: sl()));

  // REPOSITORIES
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // EXTERNAL

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: "https://run.mocky.io/v3/",
      ),
    ),
  );
}
