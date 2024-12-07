part of 'home_category_bloc.dart';

abstract class HomeCategoryEvent extends Equatable {
  const HomeCategoryEvent();

  @override
  List<Object> get props => [];
}

class HomeCategoryFetchCoffee extends HomeCategoryEvent {
  final String categoryName;
  const HomeCategoryFetchCoffee({required this.categoryName});
}
