part of 'home_category_bloc.dart';

abstract class HomeCategoryState extends Equatable {
  const HomeCategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends HomeCategoryState {}

class CategoryEBK extends HomeCategoryState {
  final CoffeBase coffeStateEBK;
  const CategoryEBK({required this.coffeStateEBK});
}

class CategorySK extends HomeCategoryState {
  final CoffeBase coffeStateSK;
  const CategorySK({required this.coffeStateSK});
}

class CategorySTK extends HomeCategoryState {
  final CoffeBase coffeStateSTK;
  const CategorySTK({required this.coffeStateSTK});
}

class CategoryError extends HomeCategoryState {
  final String message;
  const CategoryError({required this.message});
}
