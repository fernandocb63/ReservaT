import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/mailgun.dart';
import 'package:mailer/smtp_server.dart';
void main() {// Note: if you have Google's "app specific passwords" enabled,
                                       
  runApp(const BookingCalendarDemoApp());
}

class BookingCalendarDemoApp extends StatefulWidget {
  const BookingCalendarDemoApp({Key key}) : super(key: key);

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
        serviceName: 'Mock Service',
        serviceDuration: 120,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic> getBookingStreamMock(
      { DateTime end,  DateTime start}) {
    return Stream.value([]);
  }


  Future<dynamic> uploadBookingMock(
      { BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
    sendMail();

  }

    void sendMail() async {

    String username = 'fernandocb634@gmail.com';
    String password = '';

    final smtpServer = gmail(username, password);
    final equivalentMessage = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add(Address('jpmudecci@gmail.com'))
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    await send(equivalentMessage, smtpServer);
  }


  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({ dynamic streamResult}) {
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
        title: 'Booking Calendar Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Booking Calendar Demo'),
          ),
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
            ),
          ),
        ));
  }
}