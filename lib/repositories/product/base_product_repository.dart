import 'package:artsell/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
