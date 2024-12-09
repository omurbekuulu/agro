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
import 'package:agro/data/season/repositories/season.dart';
import 'package:agro/data/season/sources/season.dart';
import 'package:agro/domain/breeds/repositories/breeds.dart';
import 'package:agro/domain/breeds/use_cases/get_breeds.dart';
import 'package:agro/domain/directions/repository/directions.dart';
import 'package:agro/domain/directions/use_case/get_directoins.dart';
import 'package:agro/domain/percent/entity/percent.dart';
import 'package:agro/domain/percent/repository/percent.dart';
import 'package:agro/domain/percent/usecase/get_percent.dart';
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
  sl.registerSingleton<DirectionsService>(DirectionsServiceIpml());
  sl.registerSingleton<PercentService>(PercentServiceImpl());

  //Repositories
  sl.registerSingleton<BreedsRepository>(BreedsRepositoryImpl());
  sl.registerSingleton<SeasonRepository>(SeasonRepositoryImpl());
  sl.registerSingleton<PetsRepository>(PetsRepositoryImpl());
  sl.registerSingleton<ProfitabilityRepository>(ProfitabilityRepositoryImpl());
  sl.registerSingleton<DirectionsRepository>(DirectionsRepositoryImpl());
  sl.registerSingleton<PercentRepository>(PercentRepositoryImpl());

  //UseCases
  sl.registerSingleton<GetBreedsUseCase>(GetBreedsUseCase());
  sl.registerSingleton<GetSeasonsUseCase>(GetSeasonsUseCase());
  sl.registerSingleton<GetPetsUseCase>(GetPetsUseCase());
  sl.registerSingleton<GetProfitabilityUseCase>(GetProfitabilityUseCase());
  sl.registerSingleton<GetDirectoinsUseCase>(GetDirectoinsUseCase());
  sl.registerSingleton<GetPercentUseCase>(GetPercentUseCase());
  

}
