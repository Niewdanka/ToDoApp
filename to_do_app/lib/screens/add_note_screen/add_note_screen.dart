import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/app_config.dart';
import 'package:to_do_app/models/category.dart';
import 'package:to_do_app/models/note.dart';
import 'package:to_do_app/providers/notes.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/category_title.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/choose_category.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/create_note_button.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/date_and_time_tite.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/pick_date.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/pick_time.dart';
import 'package:to_do_app/screens/add_note_screen/widgets/title_widget.dart';
import 'package:to_do_app/widgets/vertical_line.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  static const routeName = '/add-note';

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late DateTime _pickedDate;
  late TimeOfDay _pickedTime;
  final _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  var _selectedIndex = 0;

  var _newNote = Note(
    id: '',
    date: '',
    name: '',
    description: '',
    icon: 0,
    categoryName: '',
    categoryColor: 0,
    isCompleted: 0,
    time: '',
    width: 0,
  );

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _pickedDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (date != null) {
      setState(() {
        _pickedDate = date;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _pickedTime,
    );
    if (time != null) {
      setState(() {
        _pickedTime = time;
      });
    }
  }

  void _saveFrom() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    _newNote = Note(
      id: DateFormat("dd-MM-yyyy HH:mm:ss").format(DateTime.now()),
      date: DateFormat('dd-MM-yyyy').format(_pickedDate),
      name: _newNote.name,
      description: _newNote.description,
      icon: categories[_selectedIndex].icon,
      categoryName: categories[_selectedIndex].name,
      categoryColor: categories[_selectedIndex].color,
      isCompleted: _newNote.isCompleted,
      time: _pickedTime.format(context),
      width: _newNote.width,
    );
    Provider.of<Notes>(context, listen: false).addNote(_newNote);
    Navigator.pop(context);
  }

  @override
  void initState() {
    _pickedDate = DateTime.now();
    _pickedTime = TimeOfDay.now();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double screenHeight = SizeConfig.screenHeight!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(),
              VerticalLine(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: TextFormField(
                  key: const ValueKey('title'),
                  focusNode: _titleFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Enter note name...',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'Title must be at least 5 characters long.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(_descriptionFocusNode),
                  onSaved: (newValue) => _newNote = Note(
                    id: _newNote.id,
                    date: _newNote.date,
                    name: newValue!,
                    description: _newNote.description,
                    icon: _newNote.icon,
                    categoryName: _newNote.categoryName,
                    categoryColor: _newNote.categoryColor,
                    isCompleted: _newNote.isCompleted,
                    time: _newNote.time,
                    width: _newNote.width,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: TextFormField(
                  key: const ValueKey('description'),
                  focusNode: _descriptionFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Enter note description...',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.length < 7) {
                      return 'Title must be at least 7 characters long.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                  onSaved: (newValue) => _newNote = Note(
                    id: _newNote.id,
                    date: _newNote.date,
                    name: _newNote.name,
                    description: newValue!,
                    icon: _newNote.icon,
                    categoryName: _newNote.categoryName,
                    categoryColor: _newNote.categoryColor,
                    isCompleted: _newNote.isCompleted,
                    time: _newNote.time,
                    width: _newNote.width,
                  ),
                ),
              ),
              const DateAndTimeTitle(),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: _pickDate,
                      child: PickDate(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        pickedDate: _pickedDate,
                      ),
                    ),
                    InkWell(
                      onTap: _pickTime,
                      child: PickTime(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        pickedTime: _pickedTime,
                      ),
                    ),
                  ],
                ),
              ),
              const CategoryTitle(),
              Container(
                height: screenHeight * 0.2,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: screenHeight * 0.09,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = i;
                        });
                      },
                      child: ChooseCategory(
                        selectedIndex: _selectedIndex,
                        i: i,
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: InkWell(
                  onTap: _saveFrom,
                  child: CreateNoteButton(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
