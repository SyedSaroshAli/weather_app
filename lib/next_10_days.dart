import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Next10Days extends StatelessWidget {
  final String time;
  final  String icon ;
  final String temp;
  final String temp2;
  const Next10Days({super.key,
  required this.time,
  required  this.icon,
  required this.temp,
  required this.temp2});

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      width: double.infinity,

      child : Center(
        child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation:10 ,
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
             
           
               Column(
                 children: [
                   Text(DateFormat('EEEE').format(DateTime.parse(time)).toString(),
                   style : const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                   )),

                   const SizedBox(height: 5,),

                   Text(time)
                 ],
               ),
              
            
              
            
              
             
                
                
                  Column(
                    children: [
                      Row (
                        children : [
                          const Text ('Max: '),
                          Text(temp)
                        ] 
                      ),
                  const SizedBox(height: 6,),
                       Row (
                        children : [
                          const Text ('Min: '),
                          Text(temp2)
                        ] 
                      ),
                    ],
                  ),
              
                      
                     
                  
               
                
              
            
        
              Image.network(icon)
              ]
          ),
        ),
        ),
      )
    );
  }
}