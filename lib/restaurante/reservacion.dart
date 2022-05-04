import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailer/mailer.dart';
import 'package:reserva_t/historial/bloc/addhistorial_bloc.dart';
import 'components/booking_calendar_main.dart';
import 'package:mailer/smtp_server/mailgun.dart';
import 'package:mailer/smtp_server.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(BookingCalendarDemoApp());
}

class BookingCalendarDemoApp extends StatefulWidget {
  BookingCalendarDemoApp({Key key, this.mail, this.res, this.foto})
      : super(key: key);
  String mail;
  String res;
  String foto;
  @override
  State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
  final now = DateTime.now();
  BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        servicePrice: 100,
        serviceName: 'Mock Service',  
        serviceDuration: 120,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic> getBookingStreamMock({DateTime end, DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock({BookingService newBooking}) async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String string2 = dateFormat.format(newBooking.bookingStart);
    // DateTime get = DateTime.parse(newBooking.bookingStart);

  DateTime now = DateTime.now();
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
    if (newBooking.bookingStart.isAfter(now)){
    sendMail(newBooking.bookingStart);
    BlocProvider.of<AddhistorialBloc>(context).add(
        AddHistoriall(nombre: widget.res, foto: widget.foto, fecha: string2, email: widget.mail));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No se pudo hacer la reservacion")));
    }
  }

  void sendMail(DateTime startdate) async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String string = dateFormat.format(startdate);

    

    String username = 'fernandocb634@gmail.com';
    String password = 'zzvtoxcggqypujvn';
    var usr = FirebaseAuth.instance.currentUser;
    String correo = usr.email;
    String nombreusr = usr.displayName;

    final smtpServer = gmail(username, password);
    final equivalentMessage = Message()
      ..from = Address(username, 'Reserva-T')
      ..recipients.add(Address("${widget.mail}"))
      ..subject = 'Reservacion para ${nombreusr}:: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Hola ${widget.res}</h1>\n<p>Tienes una reservacion en tu restaurante el dia ${string}</p><p>Puedes ponerte en contacto con ${nombreusr} a travez de su correo: ${correo}</p>";

    await send(equivalentMessage, smtpServer);
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    DateTime first = now;
    DateTime second = now.add(Duration(minutes: 55));
    DateTime third = now.subtract(Duration(minutes: 240));
    DateTime fourth = now.subtract(Duration(minutes: 500));
    // converted
    //     .add(DateTimeRange(start: first, end: now.add(Duration(minutes: 30))));
    // converted.add(
    //     DateTimeRange(start: second, end: second.add(Duration(minutes: 23))));
    // converted.add(
    //     DateTimeRange(start: third, end: third.add(Duration(minutes: 15))));
    // converted.add(
    //     DateTimeRange(start: fourth, end: fourth.add(Duration(minutes: 50))));
    return converted;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reservaciones',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Reservaciones'),
          ),
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              loadingWidget: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
