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
                MyPackageContainer(
                    package: 'Monthly Package',
                    price: 'Rs. 8000',
                    detail: 'detail'
                ),
                MyPackageContainer(
                    package: 'Monthly Package',
                    price: 'Rs. 15000',
                    detail: 'detail'
                ),
                MyPackageContainer(
                    package: '12 Monthly Package',
                    price: 'Rs. 18000',
                    detail: 'detail'
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
        height: 120,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(package, style: kmd1,),
                  Text(price, style: kmd.copyWith(color: Colors.indigo),),
                  Text(detail, style: ksm),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('Request this Package')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
