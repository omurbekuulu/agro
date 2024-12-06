import 'package:agro/presentation/pages/add_new_breed/widget/breed_dropdownmenu.dart';
import 'package:agro/presentation/pages/add_new_breed/widget/season_dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:agro/presentation/pages/landing/landing_page.dart';
import 'package:agro/presentation/uikit/customAppBarWithBack.dart';
import 'package:agro/presentation/uikit/customLogo.dart';

class AddNewBreedPage extends StatefulWidget {
  const AddNewBreedPage({super.key});

  @override
  State<AddNewBreedPage> createState() => _AddNewBreedPageState();
}

class _AddNewBreedPageState extends State<AddNewBreedPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                customAppBarWithBack(context, title: 'Жаңы парода кошуу'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BreedDropdownmenu(),
                        const SizedBox(height: 16),
                        const SeasonDropdownmenu(),
                        const SizedBox(height: 16),
                        const Text('Уйдун саны'),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '0',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            // Логика обработки изменения текста
                            print('Введенное значение: $value');
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введите количество';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 74,
              right: 16,
              child: customLogo(),
            ),
            Positioned(
              bottom: 12,
              left: 16,
              right: 16,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const LandingPage()),
                  );
                },
                child: const Text('Кошуу'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final Dio _dio = Dio(BaseOptions(
  //   baseUrl: 'http://ec2-16-171-165-233.eu-north-1.compute.amazonaws.com',
  // ));

  // List<Breed> _breeds = [];
  // Breed? _selectedBreed;

  // List<Season> _seasons = [];
  // Season? _selectedSeason;

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchBreeds();
  //   _fetchSeasons();
  // }

  // Future<void> _fetchBreeds() async {
  //   try {
  //     const String authToken =
  //         "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmciLCJpYXQiOjE3MzMzMTE1NDcsImV4cCI6MTczMzMyNTk0N30.IpDmLjjVvciz13sm2dzk8Srl4sG3tr1GCz6inAYG7rQ";

  //     final response = await _dio.get(
  //       '/api/breed',
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $authToken',
  //         },
  //         responseType: ResponseType.json,
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       if (response.data is List) {
  //         setState(() {
  //           _breeds = (response.data as List)
  //               .map((item) => Breed.fromJson(item))
  //               .toList();
  //         });
  //       } else {
  //         setState(() {
  //           _breeds = [];
  //         });
  //         print("Ожидали список, но получили: ${response.data}");
  //       }
  //     } else {
  //       setState(() {
  //         _breeds = [];
  //       });
  //       print("Данные не найдены");
  //     }
  //   } catch (e) {
  //     print("Ошибка при получении данных: $e");
  //     setState(() {
  //       _breeds = [];
  //     });
  //   }
  // }

  // Future<void> _fetchSeasons() async {
  //   try {
  //     const String authToken =
  //         "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmciLCJpYXQiOjE3MzMzMTE1NDcsImV4cCI6MTczMzMyNTk0N30.IpDmLjjVvciz13sm2dzk8Srl4sG3tr1GCz6inAYG7rQ";

  //     final response = await _dio.get(
  //       '/api/seasons',
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $authToken',
  //         },
  //         responseType: ResponseType.json,
  //       ),
  //     );

  //     if (response.statusCode == 200 && response.data is List) {
  //       setState(() {
  //         _seasons = (response.data as List)
  //             .map((item) => Season.fromJson(item))
  //             .toList(); // Преобразуем JSON в объекты Season
  //       });
  //     } else {
  //       print("Ошибка загрузки данных: ${response.data}");
  //       setState(() {
  //         _seasons = [];
  //       });
  //     }
  //   } catch (e) {
  //     print("Ошибка при получении данных: $e");
  //     setState(() {
  //       _seasons = [];
  //     });
  //   }
  // }