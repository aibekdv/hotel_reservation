import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());
}
