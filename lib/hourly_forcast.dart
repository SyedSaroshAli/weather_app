
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HourlyForecast extends StatelessWidget {
  final  String time;
  final  String icon ;
  final String temp;
  const HourlyForecast({super.key,
  required this.time,
  required  this.icon,
  required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
                    width: 100,
                    child: Card(
                      child : Padding(
                        padding:const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            
                            //DateTime(time),
                            Text(DateFormat('hh:mm a').format(DateTime.parse(time)).toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                            
                            const SizedBox(height: 8,),
              
                            Image.network(icon),
                        
                            const SizedBox(height: 8,),
                        
                            Text('$temp°C')
                            ],
                        ),
                      )
                    ),
                  ),
    );
  }
}