class Whether{
double temperature_c;
double temperature_f;
String condition;
String img;
String loc;
String place;
Whether({
  this.temperature_c=0,
  this.temperature_f=0,
  this.condition='Sunny',
  this.img='https://static.vecteezy.com/system/resources/previews/001/500/512/non_2x/cloudy-weather-icon-free-vector.jpg',
  this.loc='',
  this.place='',
});
factory Whether.fromJson(Map<String,dynamic> json){
  return Whether(
    temperature_c: json["current"]["temp_c"],
    temperature_f: json["current"]["temp_f"],
    condition: json["current"]["condition"]["text"],
    img: json["current"]["condition"]["icon"],
    loc: json["location"]["localtime"],
    place: json["location"]["country"],
  );
}
}