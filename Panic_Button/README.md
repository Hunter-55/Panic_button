## The Panic Button
is an application to make an alert and send your coordinates
### Technology
| technology | version |
| ------ | ------ |
| Flutter | 2.8.1 |
| Dart | 2.15.1 |
| Express | 4.17.1 |
| Nodemon | 2.0.7 |
| Socket.io | 2.3.0 |
| Leaflet | 1.7.1 |
> it is recommended to use socket.io 2.3.0 as it is compatible for flutter versions

### Lib used in Flutter
| lib | version |
| ------ | ------ |
|  socket_io_client: ^1.0.1|[socket_ioClient](https://pub.dev/packages/socket_io_client/versions/1.0.1)|
|  fluttertoast: ^8.0.8|[fluttertoast](https://pub.dev/packages/fluttertoast/versions/8.0.8)|
|  datetime_picker_formfield: ^2.0.0|[datetime_picker_formfield](https://pub.dev/packages/datetime_picker_formfield/versions/2.0.0)|
|  location: ^4.3.0|[location](https://pub.dev/packages/location/versions/4.3.0)|
|  location_web: ^3.1.1|[location_web](https://pub.dev/packages/location_web/versions/3.1.1)|
|  email_validator: ^2.0.1|[email_validator](https://pub.dev/packages/email_validator/versions/2.0.1)|
|  shared_preferences: ^2.0.13|[shared_preferences](https://pub.dev/packages/shared_preferences/versions/2.0.13)|
|  curved_navigation_bar: ^1.0.3|[curved_navigation_bar](https://pub.dev/packages/curved_navigation_bar/versions/1.0.3)|
|  flutter_map: ^0.14.0|[flutter_map](https://pub.dev/packages/flutter_map/versions/0.14.0)|
|  latlong2: ^0.8.1|[latlong2](https://pub.dev/packages/latlong2/versions/0.8.1)|

>for the use of gps we need to configure android and ios

### Android
```
android/app/src/main/AndroidManifest.xml
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
```
### IOS
```
ios/Runner/info.plist
    <key>NSLocationWhenInUseUsageDescription</key>
	<string>La aplicación requiere permisos para funcionar correctamente</string>
	<key>NSLocationAlwaysUsageDescription</key>
	<string>La aplicación requiere permisos para funcionar correctamente</string>
	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
```
### Leaflet and Socket
for better learning consult the documentation and guide of the official page
[leaflet](https://leafletjs.com/SlavaUkraini/examples/quick-start/)
[socket.io](https://socket.io/)
---
Register: ![register](/Panic_Button/img/register.jpeg)
Sing in: ![session](/Panic_Button/img/session.jpeg)
Panic Button: ![panic](/Panic_Button/img/panic.jpeg)
Perfil: ![perfil](/Panic_Button/img/perfil.jpeg)
Map: ![map](/Panic_Button/img/map.jpeg)
Alert Web: ![aler](/Panic_Button/img/alert.png)
Data User: ![data](/Panic_Button/img/datauser.png)








