import 'package:agro/data/auth/repository/auth.dart';
import 'package:agro/data/auth/source/auth_api_service.dart';
import 'package:agro/data/category/repository/category.dart';
import 'package:agro/data/category/source/category.dart';
import 'package:agro/data/transaction/repositories/expense.dart';
import 'package:agro/data/transaction/repositories/income.dart';
import 'package:agro/data/transaction/source/expense.dart';
import 'package:agro/data/transaction/source/income.dart';
import 'package:agro/domain/auth/repository/auth.dart';
import 'package:agro/domain/auth/usecase/is_logged_in.dart';
import 'package:agro/domain/auth/usecase/signin.dart';
import 'package:agro/domain/auth/usecase/signup.dart';
import 'package:agro/domain/category/repository/category.dart';
import 'package:agro/domain/category/usecase/get_all_categories.dart';
import 'package:agro/domain/pet/use_cases/post_pets.dart';
import 'package:agro/domain/transaction/repositories/expense.dart';
import 'package:agro/domain/transaction/repositories/income.dart';
import 'package:agro/domain/transaction/usecases/post_expense.dart';
import 'package:agro/domain/transaction/usecases/post_income.dart';
import 'package:get_it/get_it.dart';

import 'package:agro/core/network/dio_client.dart';
import 'package:agro/data/breeds/repositories/breeds.dart';
import 'package:agro/data/breeds/sources/breeds.dart';
import 'package:agro/data/directions/repository/directions.dart';
import 'package:agro/data/directions/source/directions.dart';
import 'package:agro/data/percent/repository/percent.dart';
import 'package:agro/data/percent/source/percent.dart';
import 'package:agro/data/pet/repositories/pets.dart';
import 'package:agro/data/pet/sources/pet.dart';
import 'package:agro/data/profitability/repository/profitability.dart';
import 'package:agro/data/profitability/source/profitability.dart';
import 'package:agro/data/recommendation/repository/recommendation.dart';
import 'package:agro/data/recommendation/source/recommendation.dart';
import 'package:agro/data/season/repositories/season.dart';
import 'package:agro/data/season/sources/season.dart';
import 'package:agro/data/transaction/repositories/transaction.dart';
import 'package:agro/data/transaction/source/transaction.dart';
import 'package:agro/domain/breeds/repositories/breeds.dart';
import 'package:agro/domain/breeds/use_cases/get_breeds.dart';
import 'package:agro/domain/directions/repository/directions.dart';
import 'package:agro/domain/directions/use_case/get_directoins.dart';
import 'package:agro/domain/percent/repository/percent.dart';
import 'package:agro/domain/percent/usecase/get_percent.dart';
import 'package:agro/domain/pet/repositories/pets.dart';
import 'package:agro/domain/pet/use_cases/get_pets.dart';
import 'package:agro/domain/profitability/repository/profitability.dart';
import 'package:agro/domain/profitability/usecase/get_profitability.dart';
import 'package:agro/domain/recommendation/repository/recommendation.dart';
import 'package:agro/domain/recommendation/usecase/get_recommendations.dart';
import 'package:agro/domain/season/repositories/season.dart';
import 'package:agro/domain/transaction/repositories/transactoin.dart';
import 'package:agro/domain/transaction/usecases/get_transactions.dart';

import '../domain/season/use_cases/get_seasons.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImple());
  sl.registerSingleton<CategoryService>(CategoryServiceImpl());
  sl.registerSingleton<BreedsService>(BreedsServiceImpl());
  sl.registerSingleton<SeasonService>(SeasonServiceImpl());
  sl.registerSingleton<PetsService>(PetsServiceImpl());
  sl.registerSingleton<ProfitabilityService>(ProfitabilityServiceImpl());
  sl.registerSingleton<DirectionsService>(DirectionsServiceIpml());
  sl.registerSingleton<PercentService>(PercentServiceImpl());
  sl.registerSingleton<RecommendationService>(RecommendationServiceImpl());
  sl.registerSingleton<TransactionService>(TransactionServiceImpl());
  sl.registerSingleton<ExpenseService>(ExpenseServiceImpl());
  sl.registerSingleton<IncomeService>(IncomeServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<BreedsRepository>(BreedsRepositoryImpl());
  sl.registerSingleton<SeasonRepository>(SeasonRepositoryImpl());
  sl.registerSingleton<PetsRepository>(PetsRepositoryImpl());
  sl.registerSingleton<ProfitabilityRepository>(ProfitabilityRepositoryImpl());
  sl.registerSingleton<DirectionsRepository>(DirectionsRepositoryImpl());
  sl.registerSingleton<PercentRepository>(PercentRepositoryImpl());
  sl.registerSingleton<RecommendationRepository>(
      RecommendationRepositoryImpl());
  sl.registerSingleton<TransactoinRepository>(TransactionRepositoryImpl());
  sl.registerSingleton<ExpenseRepository>(ExpenseRepositoryImpl());
  sl.registerSingleton<IncomeRepository>(IncomeRepositoryImpl());

  //UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetAllCategoriesUseCase>(GetAllCategoriesUseCase());
  sl.registerSingleton<GetBreedsUseCase>(GetBreedsUseCase());
  sl.registerSingleton<GetSeasonsUseCase>(GetSeasonsUseCase());
  sl.registerSingleton<GetPetsUseCase>(GetPetsUseCase());
  sl.registerSingleton<GetProfitabilityUseCase>(GetProfitabilityUseCase());
  sl.registerSingleton<GetDirectoinsUseCase>(GetDirectoinsUseCase());
  sl.registerSingleton<GetPercentUseCase>(GetPercentUseCase());
  sl.registerSingleton<GetRecommendationsUseCase>(GetRecommendationsUseCase());
  sl.registerSingleton<GetTransactionsUseCase>(GetTransactionsUseCase());
  sl.registerSingleton<PostPetsUsecase>(PostPetsUsecase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<PostExpenseUseCase>(PostExpenseUseCase());
  sl.registerSingleton<PostIncomeUseCase>(PostIncomeUseCase());
}
