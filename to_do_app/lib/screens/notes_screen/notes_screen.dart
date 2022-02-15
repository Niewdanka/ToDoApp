
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helpers/db_helper.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/providers/notes.dart';
import 'package:to_do_app/screens/notes_screen/widgets/day_and_calendar.dart';
import 'package:to_do_app/screens/notes_screen/widgets/horizontal_calendar.dart';
import 'package:to_do_app/screens/notes_screen/widgets/note_widget.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  static const routeName = '/notes';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  late DateTime _selectedDate;
  var _currentDateIndex = 0;
  var _selectedDateIndex = DateFormat('dd-MM-yyy').format(DateTime.now());
  DateTime today = DateTime.now();

  @override
  void initState() {
    _selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double screenHeight = SizeConfig.screenHeight!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DayAndCalendar(
              today: today,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              height: screenHeight * 0.125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 365,
                itemBuilder: (ctx, i) {
                  final month = DateFormat('MMM').format(
                    DateTime.now().add(
                      Duration(days: i),
                    ),
                  );
                  final day = DateFormat('EEE').format(
                    DateTime.now().add(
                      Duration(days: i),
                    ),
                  );
                  return InkWell(
                    onTap: _currentDateIndex == i
                        ? null
                        : () {
                            setState(() {
                              _currentDateIndex = i;
                              _selectedDate = DateTime.now().add(
                                Duration(days: _currentDateIndex),
                              );
                              _selectedDateIndex =
                                  DateFormat('dd-MM-yyy').format(_selectedDate);
                            });
                          },
                    child: HorizontalCalendar(
                      screenWidth: screenWidth,
                      currentDateIndex: _currentDateIndex,
                      month: month,
                      screenHeight: screenHeight,
                      today: today,
                      day: day,
                      i: i,
                    ),
                  );
                },
              ),
            ),
            FutureBuilder(
              future: Provider.of<Notes>(context, listen: false).fetchNotes(),
              builder: (context, snapshot) => Consumer<Notes>(
                builder: (ctx, notes, _) => Expanded(
                  child: ListView.builder(
                    itemCount: notes.notes.length,
                    itemBuilder: (ctx, i) => notes.notes[i].date ==
                            _selectedDateIndex
                        ? Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 5, left: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        if (notes.notes[i].isCompleted == 0) {
                                          notes.notes[i].isCompleted = 1;
                                          notes.notes[i].width =
                                              (screenWidth * 0.78).toInt();
                                        } else {
                                          notes.notes[i].isCompleted = 0;
                                          notes.notes[i].width = 0;
                                        }
                                      });
                                      await DBHelper.update(notes.notes[i]);
                                    },
                                    icon: Icon(
                                      notes.notes[i].isCompleted == 1
                                          ? FontAwesomeIcons.solidCheckSquare
                                          : FontAwesomeIcons.expand,
                                      color: notes.notes[i].isCompleted == 1
                                          ? kPrimaryColor
                                          : Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                NoteWidget(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  i: i,
                                  notes: notes,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
