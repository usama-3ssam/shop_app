// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/address/adderss_cubit/states.dart';
import 'package:shop_app/model/address_model.dart';
import 'package:shop_app/network/end_points/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(AddressInitialStates());
  static AddressCubit get(context) => BlocProvider.of(context);

  AddressModel? addressModel;

  void userAddress({
    required String city,
    required String region,
    required String name,
    required String details,
    required String payment,
  }) {
    emit(AddressLoadingStates());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'city': city,
        'name': name,
        'region': region,
        'details': details,
        'payment': payment,
      },
    ).then((value) {
      print(value.data);
      addressModel = AddressModel.fromJson(value.data);
      emit(AddressSuccessStates(addressModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AddressErrorStates(error.toString()));
    });
  }
}
