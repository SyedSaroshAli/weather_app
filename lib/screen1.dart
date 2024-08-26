import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/additonal_infoI_tems.dart';
import 'package:flutter_application_1/hourly_forcast.dart';
import 'package:flutter_application_1/next_10_days.dart';

//import 'package:google_fonts/google_fonts.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});
  
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController _controller = TextEditingController();
  String city = 'karachi';
  Map<String, dynamic>? weatherData;
  String time ='';

  Future<void> getCurrentWeather(String city) async {
    try {
      final res = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=8bcc7a1a74cf46c79ec90521240706&q=$city&days=30&aqi=yes&alerts=yes'
      ));
    
      if (res.statusCode != 200) {
        throw 'An unexpected error occurred';
      }
    
      setState(() {
        weatherData = jsonDecode(res.body);
      });
    } catch (e) {
      setState(() {
        weatherData = null;
      });
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather(city); // Fetch weather for the initial city
  }

  void updateCity() {
    setState(() {
      city = _controller.text;
    
    });
    getCurrentWeather(city); // Fetch weather for the new city
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Weather Edge',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              updateCity();
            },
            icon: const Icon(Icons.refresh)
          )
        ],
      ),
      body: weatherData == null
        ? const Center(child: CircularProgressIndicator.adaptive())
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {},
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) { updateCity(); },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              updateCity();
                            },
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          )
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20,),
  weatherData==null ? const Center( child : CircularProgressIndicator.adaptive()) : 
                     Padding(
                       padding: const EdgeInsets.only(left :8),
                       child: Text(
                        city.toUpperCase(),
                         style:  const TextStyle(
                          fontWeight: FontWeight.bold,
                         fontSize: 30,
                        ),
                       ),
                     ),
                     const SizedBox(height: 4,),
                     const Padding(
                       padding: EdgeInsets.only(left :8),
                       child:  Text('Current weather'),
                     ),
                    
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${weatherData!['current']['temp_c']}°C',
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Image.network(
                                    'https:${weatherData!['current']['condition']['icon']}',
                                     
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    weatherData!['current']['condition']['text'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        )
                      )
                    ),
                    const SizedBox(height: 20),
                    
                       
                    const Padding(
                      padding:  EdgeInsets.only(left :8.0),
                      child:  Text(
                        'Hourly Forecast',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,                        
                        fontSize: 24,
                      
                            ),
                            ),
                    ),
                      
                          
                 
                      
                    
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 24; i++)
                            
                            HourlyForecast(
                              
                              time: weatherData!['forecast']['forecastday'][0]['hour'][i]['time'].toString(),
                              icon: weatherData!['forecast']['forecastday'][0]['hour'][i]['condition']['icon'],
                              temp: weatherData!['forecast']['forecastday'][0]['hour'][i]['temp_c'].toString(),
                            ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left :8.0),
                      child:  Text(
                        'Additional Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfoItems(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value: weatherData!['current']['humidity'].toString(),
                        ),
                        AdditionalInfoItems(
                          icon: Icons.air,
                          label: 'Wind Speed',
                          value: '${weatherData!['current']['wind_kph']} kph',
                        ),
                        AdditionalInfoItems(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          value: '${weatherData!['current']['pressure_mb']} mb',
                        ),
                      ]
                    ),
                  
                    const SizedBox(height: 16,),

                    const Padding(
                      padding: EdgeInsets.only(left :8.0),
                      child: Text('Next 10 days Forecast',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ),    
                    
                    const SizedBox(height: 16,),

                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      height: 300,
                       child :SingleChildScrollView(
                         scrollDirection: Axis.vertical,
                         child: Column(
                          children: [
                                for(int i = 1; i <11; i++)
                                Next10Days(
                                   time: weatherData!['forecast']['forecastday'][i]['date'].toString(),
                                   icon: weatherData!['forecast']['forecastday'][i]['day']['condition']['icon'],
                                   temp: weatherData!['forecast']['forecastday'][i]['day']['maxtemp_c'].toString(),
                                   temp2: weatherData!['forecast']['forecastday'][i]['day']['mintemp_c'].toString(),
                                 ),
                               const SizedBox(width: 8),]),
                       ) ), 

                       SizedBox(height: 14,),
                       const Center(
                         child:  Text('Designed by Syed Saroosh Ali',
                         style: TextStyle(
                          fontSize: 12,
                         )),
                       ) 

  ]),
            )),
          )
  
  );}
  
}

