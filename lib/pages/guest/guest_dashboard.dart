import 'package:flutter/material.dart';

import '../../constants.dart';

class GuestDashboard extends StatefulWidget {
  const GuestDashboard({Key? key}) : super(key: key);

  @override
  State<GuestDashboard> createState() => _GuestDashboardState();
}

class _GuestDashboardState extends State<GuestDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: kpdh20,
            child: Column(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: kprimary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        gaph20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:  [
                                const Icon(Icons.fitness_center,
                                  color: Colors.white,),
                                gapw10,
                                Text('The Muscle Bar',
                                  style: kmd.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_active,
                                color: Colors.white,),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                gaph20,
                                Text('00',
                                  style: klg.copyWith(color: Colors.white),
                                ),
                                Text('Steps Today', style: ksm.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                gaph20,
                gaph20,
                Row(
                  children: const [
                    gapw20,
                    Text('Overview',
                        style: kmd
                    )
                  ],
                ),
                gaph20,
                gaph10,
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const ListTile(
                        title: Text('Weight'),
                        leading: Icon(Icons.fitness_center),
                        trailing: Text('00 Kg'),
                      ),
                    ),
                    gaph20,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const ListTile(
                        title: Text('Macros'),
                        leading: Icon(Icons.fitness_center),
                        trailing: Text('00 KCal/Day'),
                      ),
                    ),
                  ],
                ),
                gaph20,
                Row(
                  children: const [
                    gapw20,
                    Text('Activity',
                        style: kmd
                    )
                  ],
                ),
                gaph20,
                gaph10,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('00',
                              style: kmd1,
                            ),
                            Text('Steps'),
                          ],
                        ),
                      ),
                    ),
                    gapw20,
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('00',
                              style: kmd1,
                            ),
                            Text('Calories'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                gaph20,
                gaph20,
                Row(
                  children: const [
                    gapw20,
                    Text('Daily Macros',
                        style: kmd
                    )
                  ],
                ),
                gaph20,
                gaph10,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('000 g',
                              style: kmd1,
                            ),
                            Text('Protiens'),
                          ],
                        ),
                      ),
                    ),
                    gapw10,
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('000 g',
                              style: kmd1,
                            ),
                            Text('Carbs'),
                          ],
                        ),
                      ),
                    ),
                    gapw10,
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('000 g',
                              style: kmd1,
                            ),
                            Text('Fats'),
                          ],
                        ),
                      ),
                    ),
                    gapw10,
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('000 g',
                              style: kmd1,
                            ),
                            Text('Calories'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                gaph20




              ],
            ),
          ),
        ),
      ),
    );
  }
}