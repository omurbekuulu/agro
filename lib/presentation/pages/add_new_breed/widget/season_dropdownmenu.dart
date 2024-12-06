import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/add_new_breed/entities/season.dart';
import '../cubit/season_cubit.dart';

class SeasonDropdownmenu extends StatefulWidget {
  const SeasonDropdownmenu({super.key});

  @override
  State<SeasonDropdownmenu> createState() => _SeasonDropdownmenuState();
}

class _SeasonDropdownmenuState extends State<SeasonDropdownmenu> {
  SeasonEntity? _selectedSeason;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeasonsCubit()..getSeasons(),
      child: BlocBuilder<SeasonsCubit, SeasonsState>(
        builder: (context, state) {
          if (state is LoadingSeasons) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is LoadedSeasons) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Уйдун жашы'),
                const SizedBox(height: 4),
                DropdownButtonFormField<SeasonEntity>(
                  hint: const Text('Жашын тандаңыз'),
                  value: _selectedSeason,
                  items: state.seasons.map((season) {
                    return DropdownMenuItem<SeasonEntity>(
                      value: season,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width - 80,
                        ),
                        child: Text(
                          season.name!,
                          style: TextStyle(fontSize: 16),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSeason = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadSeasons) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
