import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () => addDataBottomSheet(context),
          child: Text(
            'data',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 1.h),
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        height: 9.6.h,
        child: TextButton(
          onPressed: () => addDataBottomSheet(context),
          child: const Text('data',
              style: TextStyle(color: Colors.white, fontSize: 13)),
        ),
      ),
    );
  }

  Future<dynamic> addDataBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      context: context,
      builder: (context) => Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const GetDataModalSheet(
              title: 'title',
              data: '3424',
              subtitle: 'subtitle',
            ),
            SetDataModalSheet(
              title: 'Altura',
              onPressed: () {},
              textEditingController: textEditingController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

class SetDataModalSheet extends StatelessWidget {
  const SetDataModalSheet({
    super.key,
    required this.title,
    this.onPressed,
    required this.textEditingController,
    required this.keyboardType,
  });

  final String title;
  final void Function()? onPressed;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ),
          TextFormField(
            controller: textEditingController,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintText: 'CM',
              hintStyle: Theme.of(context).textTheme.labelLarge,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              suffixStyle: Theme.of(context).textTheme.labelLarge,
              floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
              errorStyle: Theme.of(context).textTheme.labelLarge,
              helperStyle: Theme.of(context).textTheme.labelLarge,
              prefixStyle: Theme.of(context).textTheme.labelLarge,
              counterStyle: Theme.of(context).textTheme.labelLarge,
              fillColor: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFf7f8fe),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
                SizedBox(width: 2.5.w),
                CircleAvatar(
                  backgroundColor: const Color(0xFFf7f8fe),
                  child: IconButton(
                    onPressed: () =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                  ),
                ),
                SizedBox(width: 2.5.w),
                CircleAvatar(
                  backgroundColor: const Color(0xFFf7f8fe),
                  child: IconButton(
                    onPressed: () => textEditingController.clear(),
                    icon: const Icon(
                      Icons.clear_all_rounded,
                    ),
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: const Color(0xFF2bd98e),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetDataModalSheet extends StatelessWidget {
  const GetDataModalSheet({
    super.key,
    required this.title,
    required this.data,
    required this.subtitle,
  });

  final String title, data, subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFFf7f8fe),
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'actual'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              data,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
