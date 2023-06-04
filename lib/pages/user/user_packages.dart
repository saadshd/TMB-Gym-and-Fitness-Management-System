import 'package:flutter/material.dart';
import 'package:tmb_fyp/pages/user/widgets/package_container.dart';
import '../../constants.dart';

class UserPackages extends StatefulWidget {
  const UserPackages({Key? key}) : super(key: key);

  @override
  State<UserPackages> createState() => _UserPackagesState();
}

class _UserPackagesState extends State<UserPackages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Packages'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: kpda20,
            child: Column(
              children: const [
                MyPackageContainer(
                    package: 'Monthly Plan',
                    price: 'Rs. 8000',
                    detail: 'Standard Budget Plan'
                ),
                MyPackageContainer(
                    package: '1 Month Medical Condition Plan',
                    price: 'Rs. 10000',
                    detail: 'Caters to your medical condition'
                ),
                MyPackageContainer(
                    package: 'Postmartum Plan',
                    price: 'Rs. 15000',
                    detail: 'For the new members'
                ),
                MyPackageContainer(
                    package: 'Transformation Plan',
                    price: 'Rs. 20000',
                    detail: '12 week transformation plan'
                ),
                MyPackageContainer(
                    package: 'Transformation Plan',
                    price: 'Rs. 20000',
                    detail: '12 week transformation plan'
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}


