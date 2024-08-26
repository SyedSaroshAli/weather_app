import 'package:flutter/material.dart';

class AdditionalInfoItems extends StatelessWidget {

  final IconData icon;
  final String label;
  final String value;

  const AdditionalInfoItems({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return 
        Container(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Icon(icon,
               size: 37,
               ),
    
               const SizedBox(height: 8,),
        
               Text(label
               ),
    
               const SizedBox(height: 8,),
        
               Text(value,
               style: const TextStyle(
                 fontSize: 17,
                 fontWeight: FontWeight.bold,
               ),)
             ],
           ),
         ),
        );
      
    
  }
}
