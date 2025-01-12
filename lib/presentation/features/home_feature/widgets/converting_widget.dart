import 'package:currency_converter/core/widgets/custom_text_form_field.dart';
import 'package:currency_converter/presentation/features/home_feature/view_model/cubit.dart';
import 'package:currency_converter/presentation/features/home_feature/view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertingWidget extends StatelessWidget {
  const ConvertingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConvertingCubit>(
      create: (context) => ConvertingCubit(),
      child: BlocBuilder<ConvertingCubit, ConvertingStates>(
          builder: (context, state) {
        var cubitControl = ConvertingCubit.get(context);

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/worldmap.jpg',
              ),
              opacity: 0.3,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            spacing: 10,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                child: Divider(
                  thickness: 8,
                  color: Colors.blue.shade400,
                ),
              ),
              Text("From:"),
              DropdownMenu(
                hintText: 'From',
                controller: cubitControl.fromController,
                width: 300,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'USD', label: 'USD'),
                  DropdownMenuEntry(value: 'EGP', label: 'EGP'),
                  DropdownMenuEntry(value: 'SAR', label: 'SAR'),
                ],
              ),
              Center(
                child: MyCustomTextFormField(
                  hintText: 'Amount',
                  controller: cubitControl.amountController,
                ),
              ),
              Center(
                child: DropdownMenu(
                  hintText: 'to',
                  controller: cubitControl.toController,
                  width: 300,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'USD', label: 'USD'),
                    DropdownMenuEntry(value: 'EGP', label: 'EGP'),
                    DropdownMenuEntry(value: 'SAR', label: 'SAR'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Result:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    state is ConvertingSuccessState ? state.currency! : '0.00',
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ],
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  cubitControl.convert().then(
                    (value) {
                      if (value) {}
                    },
                  );
                },
                child: Text(
                  'Convert',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
