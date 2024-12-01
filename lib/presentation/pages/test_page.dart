import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DirectionsScreen extends StatefulWidget {
  const DirectionsScreen({Key? key}) : super(key: key);

  @override
  State<DirectionsScreen> createState() => _DirectionsScreenState();
}

class _DirectionsScreenState extends State<DirectionsScreen> {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'http://ec2-16-171-165-233.eu-north-1.compute.amazonaws.com',
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIiwiaWF0IjoxNzMzMDY0MjQ3LCJleHAiOjE3MzMwNzg2NDd9.WJqB4ZaDlAfHtyEc8X8d4G0l0uy_nSVH_mWx9i9SlUQ',
    },
  ));

  List<dynamic> directions = [];
  bool isLoading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directions'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text('Error: $error'))
              : ListView.builder(
                  itemCount: directions.length,
                  itemBuilder: (context, index) {
                    final direction = directions[index];
                    return ListTile(
                      title: Text(direction['name'] ?? 'No Name'),
                      subtitle: Text('ID: ${direction['id']}'),
                    );
                  },
                ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: fetchDirections,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: addDirection,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<void> fetchDirections() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final response = await dio.get('/directions');
      print('fetching');
      setState(() {
        directions = response.data as List<dynamic>;
      });
      print('completed');
    } on DioException catch (e) {
      setState(() {
        error = e.response?.data.toString() ?? e.message;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> addDirection() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      print('adding');
      final response = await dio.post(
        '/directions',
        data: {
          "name": "New Direction", // Замените на нужное имя
          "categoryId": 1, // Укажите ID категории
        },
      );
      print('Added Direction: ${response.data}');
      fetchDirections(); // Обновить список после добавления
    } on DioException catch (e) {
      setState(() {
        error = e.response?.data.toString() ?? e.message;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
