import 'package:artsell/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
