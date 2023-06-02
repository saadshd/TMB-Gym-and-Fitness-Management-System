import 'package:flutter/material.dart';

import '../../constants.dart';

class GuestPackages extends StatefulWidget {
  const GuestPackages({Key? key}) : super(key: key);

  @override
  State<GuestPackages> createState() => _GuestPackagesState();
}

class _GuestPackagesState extends State<GuestPackages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: kpda20,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Packages',
                  style: kmd.copyWith(color: kprimary),),
                ),
                const MyPackageContainer(
                    package: 'Monthly Plan',
                    price: 'Rs. 8000',
                    detail: 'Standard Budget Plan'
                ),
                const MyPackageContainer(
                    package: '1 Month Medical Condition Plan',
                    price: 'Rs. 10000',
                    detail: 'Caters to your medical condition'
                ),
                const MyPackageContainer(
                    package: 'Postmartum Plan',
                    price: 'Rs. 15000',
                    detail: 'For the new members'
                ),
                const MyPackageContainer(
                    package: 'Transformation Plan',
                    price: 'Rs. 20000',
                    detail: '12 week transformation plan'
                ),
                const MyPackageContainer(
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

class MyPackageContainer extends StatelessWidget {
  const MyPackageContainer({
    Key? key,
    required this.package,
    required this.price,
    required this.detail
  }) : super(key: key);

  final String package;
  final String price;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.indigo.shade100,
              Colors.grey.shade50,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: kpda20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(package, style: kmd1,),
                  Text(price, style: kmd.copyWith(color: Colors.indigo),),
                  Text(detail, style: ksm),
                ],
              ),
              gaph20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: const Text('Request this Package')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
