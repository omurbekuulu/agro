import 'package:agro/core/network/dio_client.dart';
import 'package:agro/data/breeds/repositories/breeds.dart';
import 'package:agro/data/breeds/sources/breeds.dart';
import 'package:agro/data/pet/repositories/pets.dart';
import 'package:agro/data/pet/sources/pet.dart';
import 'package:agro/data/profitability/repository/profitability.dart';
import 'package:agro/data/profitability/source/profitability.dart';
import 'package:agro/data/season/repositories/season.dart';
import 'package:agro/data/season/sources/season.dart';
import 'package:agro/domain/breeds/repositories/breeds.dart';
import 'package:agro/domain/breeds/use_cases/get_breeds.dart';
import 'package:agro/domain/pet/repositories/pets.dart';
import 'package:agro/domain/pet/use_cases/get_pets.dart';
import 'package:agro/domain/profitability/repository/profitability.dart';
import 'package:agro/domain/profitability/usecase/get_profitability.dart';
import 'package:agro/domain/season/repositories/season.dart';
import 'package:get_it/get_it.dart';

import '../domain/season/use_cases/get_seasons.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<BreedsService>(BreedsServiceImpl());
  sl.registerSingleton<SeasonService>(SeasonServiceImpl());
  sl.registerSingleton<PetsService>(PetsServiceImpl());
  sl.registerSingleton<ProfitabilityService>(ProfitabilityServiceImpl());

  //Repositories
  sl.registerSingleton<BreedsRepository>(BreedsRepositoryImpl());
  sl.registerSingleton<SeasonRepository>(SeasonRepositoryImpl());
  sl.registerSingleton<PetsRepository>(PetsRepositoryImpl());
  sl.registerSingleton<ProfitabilityRepository>(ProfitabilityRepositoryImpl());

  //UseCases
  sl.registerSingleton<GetBreedsUseCase>(GetBreedsUseCase());
  sl.registerSingleton<GetSeasonsUseCase>(GetSeasonsUseCase());
  sl.registerSingleton<GetPetsUseCase>(GetPetsUseCase());
  sl.registerSingleton<GetProfitabilityUseCase>(GetProfitabilityUseCase());
}
