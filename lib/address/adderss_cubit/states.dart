import 'package:shop_app/model/address_model.dart';

abstract class AddressStates {}

class AddressInitialStates extends AddressStates {}

class AddressLoadingStates extends AddressStates {}

class AddressSuccessStates extends AddressStates {
  final AddressModel addressModel;

  AddressSuccessStates(this.addressModel);
}

class AddressErrorStates extends AddressStates {
  final String error;
  AddressErrorStates(this.error);
}
