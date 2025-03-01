// import 'package:flutter/material.dart';

// import 'package:agro/core/configs/theme/theme.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../common/widgets/customLogo.dart';
// import '../../../../common/widgets/customTextFormField.dart';

// class AddExpensePage extends StatefulWidget {
//   const AddExpensePage({
//     super.key,
//     required this.selectedPetId,
//   });

//   final int selectedPetId;

//   @override
//   State<AddExpensePage> createState() => _AddExpensePageState();
// }

// class _AddExpensePageState extends State<AddExpensePage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController quantityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).appColors;
//     final typography = Theme.of(context).appTypography;

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Кошумча чыгаша',
//                           style: typography.h2.bold,
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'Артка кайтуу',
//                             style: typography.p1.bold
//                                 .copyWith(color: Colors.black),
//                           ),
//                         )
//                       ],
//                     ),
//                     SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 14),
//                           Text(
//                             'Сумма',
//                             style: typography.p1.medium.copyWith(
//                               color: colors.secondary1,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           customTextFormField(
//                             context,
//                             controller: priceController,
//                             inputType: TextInputType.number,
//                             hintText: '0 с',
//                           ),
//                           const SizedBox(height: 24),
//                           Text(
//                             'Комментарий (Аты)',
//                             style: typography.p1.medium.copyWith(
//                               color: colors.secondary1,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           customTextFormField(
//                             context,
//                             controller: descriptionController,
//                             inputType: TextInputType.text,
//                             hintText: 'Кошумча сөздөр',
//                           ),
//                           const SizedBox(height: 24),
//                           Text(
//                             'Саны',
//                             style: typography.p1.medium.copyWith(
//                               color: colors.secondary1,
//                             ),
//                           ),
//                           customTextFormField(
//                             context,
//                             controller: quantityController,
//                             inputType: TextInputType.number,
//                             hintText: '0',
//                           ),
//                           const SizedBox(height: 125),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 74,
//               right: 16,
//               child: customLogo(),
//             ),
//             Positioned(
//               bottom: 12,
//               right: 16,
//               left: 16,
//               child: FilledButton(
//                 onPressed: () async {
//                   context.read<HomeCubit>().addExpense(
//                         selectedPetId: widget.selectedPetId,
//                         recommId: -1,
//                         expense: ExpenseEntity(
//                           price: int.parse(priceController.text),
//                           description: descriptionController.text,
//                           quantity: int.parse(quantityController.text),
//                         ),
//                       );
//                   AppNavigator.pushAndRemove(context, const LandingPage());
//                 },
//                 child: const Text('Кошуу'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
