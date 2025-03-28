import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widgets/customLogo.dart';
import '../../../../common/widgets/customTextFormField.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({
    super.key,
    required this.onTap,
    required this.priceController,
    required this.descriptionController,
    required this.quantityController,
    required this.isInomce,
    required this.isConflict,
  });

  final bool isInomce;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController quantityController;
  final Function() onTap;
  final bool isConflict;

  @override
  _RecordingPageState createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.priceController.addListener(_updateValidation);
    widget.descriptionController.addListener(_updateValidation);
    widget.quantityController.addListener(_updateValidation);
  }

  @override
  void dispose() {
    widget.priceController.removeListener(_updateValidation);
    widget.descriptionController.removeListener(_updateValidation);
    widget.quantityController.removeListener(_updateValidation);
    super.dispose();
  }

  void _updateValidation() {
    setState(() {});
  }

  void _handleTap(BuildContext context) {
    final colors = Theme.of(context).appColors;
    if (widget.quantityController.text == '0' && widget.isInomce) {
      showDialog(
        context: context,
        builder: (contextDialog) => AlertDialog(
          content: const Text('Киреше үчүн cаны 0 боло албайт'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(contextDialog).pop(),
              child: Text(
                'ОК',
                style: TextStyle(color: colors.primary),
              ),
            ),
          ],
        ),
      );
      return;
    } else {
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    final isValid = _formKey.currentState?.validate() ?? false;

    return BlocListener<StatisticsCubit, StatisticsState>(
      listener: (context, state) {
        if (state.isConflict) {
          showDialog(
            context: context,
            builder: (contextDialog) => AlertDialog(
              content: const Text(
                  'Сиз өзүңүздөгү жаныбарларга караганда көбүрөөк жаныбарларды тизмектедиңиз.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(contextDialog).pop();
                  },
                  child: Text(
                    'ОК',
                    style: TextStyle(color: colors.primary),
                  ),
                ),
              ],
            ),
          );
        }
        if (!state.isConflict) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.isInomce ? 'Жаңы киреше' : 'Кошумча чыгаша',
                            style: typography.h2.bold,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Артка кайтуу',
                              style: typography.p1.bold
                                  .copyWith(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 14),
                            Text(
                              'Сумма',
                              style: typography.p1.medium.copyWith(
                                color: colors.secondary1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            customTextFormField(
                              context,
                              controller: widget.priceController,
                              inputType: TextInputType.number,
                              hintText: '0 с',
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Комментарий (Аты)',
                              style: typography.p1.medium.copyWith(
                                color: colors.secondary1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            customTextFormField(
                              context,
                              controller: widget.descriptionController,
                              inputType: TextInputType.text,
                              hintText: 'Кошумча сөздөр',
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Саны',
                              style: typography.p1.medium.copyWith(
                                color: colors.secondary1,
                              ),
                            ),
                            customTextFormField(
                              context,
                              controller: widget.quantityController,
                              inputType: TextInputType.number,
                              hintText: '0',
                              hasValue: true,
                              hasUnderLine: true,
                            ),
                            const SizedBox(height: 125),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 74,
                right: 16,
                child: customLogo(),
              ),
              Positioned(
                bottom: 12,
                right: 16,
                left: 16,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      isValid == true ? colors.primary : colors.onBackground,
                    ),
                  ),
                  onPressed: isValid == true
                      ? () {
                          _handleTap(context);
                        }
                      : null,
                  child: const Text('Кошуу'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
