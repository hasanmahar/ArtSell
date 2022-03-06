import 'package:artsell/models/models.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
