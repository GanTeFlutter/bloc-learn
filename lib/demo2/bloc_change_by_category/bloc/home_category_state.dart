part of 'home_category_bloc.dart';

abstract class HomeCategoryState extends Equatable {
  const HomeCategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends HomeCategoryState {}

class CoffeeKategoryState extends HomeCategoryState {
  final CoffeeKatagori coffeStateK;
  const CoffeeKategoryState({required this.coffeStateK});
}

class CategoryError extends HomeCategoryState {
  final String message;
  const CategoryError({required this.message});
}
