import 'package:calendar/constants/limit.dart';
import 'package:calendar/constants/size.dart';
import 'package:calendar/database/local_storage.dart';
import 'package:calendar/functions/common.dart';
import 'package:calendar/models/child/add_event.dart';
import 'package:calendar/models/child/event_item.dart';
import 'package:calendar/screens/event_color_screen.dart';
import 'package:calendar/widgets/space.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../constants/colors.dart';

class EventFormScreen extends StatefulWidget {
  final DateTime selectedTime;
  final void Function(CalendarEventData) onAddEvent;

  const EventFormScreen({
    required this.selectedTime,
    required this.onAddEvent,
    Key? key,
  }) : super(key: key);

  @override
  State<EventFormScreen> createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  TextEditingController _titleController = TextEditingController(text: "");
  TextEditingController _titleDescriptionController =
      TextEditingController(text: "");
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool _entireDayEvent = false;
  Color _eventColor = CustomColors.gradient_color2;
  DateTime? _startDateTime;
  DateTime? _endDateTime;
  TextEditingController _startTimeController = TextEditingController(text: "");
  TextEditingController _endTimeController = TextEditingController(text: "");

  void setInitialTime() {
    final st = TimeOfDay(
      hour: widget.selectedTime.hour,
      minute: widget.selectedTime.minute,
    );

    final et = TimeOfDay(
      hour: widget.selectedTime.hour + 1,
      minute: widget.selectedTime.minute,
    );

    setState(() {
      _startTime = st;
      _endTime = et;
      _startTimeController.text = st.format(context);
      _endTimeController.text = et.format(context);
    });

    setState(() {
      _startDateTime = widget.selectedTime;
    });

    DateTime end = Common.getCurrentDate(
      day: widget.selectedTime.day,
      hour: widget.selectedTime.hour + 1,
      minute: widget.selectedTime.minute,
      month: widget.selectedTime.month,
      second: widget.selectedTime.second,
      year: widget.selectedTime.year,
    );

    setState(() {
      _endDateTime = end;
    });
  }

  @override
  void initState() {
    super.initState();
    // add listener to each textEditingController if required here.
    _titleController.addListener(titleListener);
    _titleDescriptionController.addListener(titleDescListener);
    _startTimeController.addListener(startTimeListener);
    _endTimeController.addListener(endTimeListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setInitialTime();
  }

  @override
  void dispose() {
    // Dispose each and every textEditingController here.
    _titleController.dispose();
    _titleDescriptionController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();

    super.dispose();
  }

  void titleListener() {}
  void titleDescListener() {}
  void startTimeListener() {}
  void endTimeListener() {}

  void onEntireDaySwitchChange(bool value) {
    if (value) {
      setState(() {
        _startTime = TimeOfDay(hour: 00, minute: 00);
        _startTimeController.text = _startTime!.format(context);
        _endTime = TimeOfDay(hour: 24, minute: 00);
        _endTimeController.text = _endTime!.format(context);
      });
    } else {
      _startTime = null;
      _startTimeController.text = '';
      _endTime = null;
      _endTimeController.text = '';
    }
    setState(() {
      _entireDayEvent = value;
    });
  }

  void onColorChange(Color newColor) {
    setState(() {
      _eventColor = newColor;
    });
  }

  Widget makeUserInput({
    required TextEditingController text_controller,
    TextInputAction text_input_action = TextInputAction.next,
    TextInputType key_board_type = TextInputType.name,
    IconData? prefix_icon_data,
    bool obscure_text = false,
    bool enabled = true,
    int max_len = NAME_LIM,
    void Function(String)? onFieldSubmitted,
    String? Function(String?)? validator,
    required String hint_text,
  }) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return TextFormField(
      controller: text_controller,
      cursorColor: enabled ? CustomColors.primary_light : null,
      autovalidateMode: AutovalidateMode.always,
      autofocus: false,
      autocorrect: true,
      enabled: enabled,
      obscureText: obscure_text,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: text_input_action,
      keyboardType: key_board_type,
      validator: validator,
      maxLength: max_len,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefix_icon_data == null
            ? null
            : Icon(
                prefix_icon_data,
                color: CustomColors.gradient_color2,
              ),
        suffixIcon: enabled
            ? IconButton(
                onPressed: () {
                  text_controller.clear();
                },
                icon: Icon(
                  Icons.cancel_rounded,
                  color: CustomColors.gradient_color2,
                ),
              )
            : null,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        filled: true,
        // labelText: hint_text,
        hintText: hint_text,
        labelStyle: TextStyle(
          color: enabled ? CustomColors.primary_light : CustomColors.dark_grey,
        ),
        fillColor: CustomColors.textbox,
      ),
      style: TextStyle(
        color: enabled ? CustomColors.primary_light : CustomColors.dark_grey,
        fontSize: CustomSize.size(
          width,
          height,
          15,
        ),
      ),
    );
  }

  Future<void> saveEvent() async {
    print(_startTimeController.text);
    // print(Common.dateTimeDecode(_startTimeController.text));
    AddEvent addEvent = AddEvent(
      eventName: _titleController.text,
      creationDate: Common.getCurrentDate(),
      eventStartDate: _startDateTime!,
      eventEndDate: _endDateTime!,
      eventDescription: _titleDescriptionController.text,
      color: _eventColor,
      task: [],
    );
    EventItem eventAdded = await LocalStorage.addEvent(addEvent);

    widget.onAddEvent(eventAdded.toCalendarEventData());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).viewPadding.top;
    final double actualHeight = height - topPadding;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            decoration: BoxDecoration(
              color: CustomColors.light_blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Space(spaceY: 30),
              makeUserInput(
                prefix_icon_data: Icons.event_rounded,
                text_controller: _titleController,
                hint_text: "Enter your event title",
              ),
              Space(spaceY: 10),
              makeUserInput(
                max_len: DESC_LIM,
                prefix_icon_data: Icons.description_rounded,
                text_controller: _titleDescriptionController,
                hint_text: "Enter your event description",
              ),
              Space(spaceY: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Day Event",
                        style: TextStyle(
                          fontSize: CustomSize.size(width, height, 14),
                        ),
                      ),
                      Switch(
                        value: _entireDayEvent,
                        onChanged: onEntireDaySwitchChange,
                        activeColor: CustomColors.gradient_color2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: CustomSize.getWidth(width, 20),
                        height: CustomSize.getWidth(width, 20),
                        decoration: BoxDecoration(
                          color: _eventColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            useSafeArea: true,
                            context: context,
                            builder: (BuildContext context) {
                              return EventColorScreen(
                                color: _eventColor,
                                onColorChange: onColorChange,
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(
                          primary: CustomColors.gradient_color2,
                        ),
                        child: Text(
                          "Event Color",
                          style: TextStyle(
                            fontSize: CustomSize.size(
                              width,
                              height,
                              15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Space(spaceY: 10),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.9 * 0.5,
                    child: TextButton(
                      onPressed: _entireDayEvent
                          ? null
                          : () async {
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                  widget.selectedTime,
                                ),
                              );

                              if (newTime != null) {
                                setState(() {
                                  _startTime = newTime;
                                  _startTimeController.text =
                                      newTime.format(context) +
                                          (newTime.hour >= 12 ? " PM" : " AM");
                                });
                              }
                            },
                      child: makeUserInput(
                        enabled: false,
                        prefix_icon_data: Icons.hourglass_top_rounded,
                        text_controller: _startTimeController,
                        hint_text: "Start Time",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.9 * 0.5,
                    child: TextButton(
                      onPressed: _entireDayEvent
                          ? null
                          : () async {
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                  widget.selectedTime,
                                ),
                              );

                              if (newTime != null) {
                                setState(() {
                                  _endTime = newTime;
                                  _endTimeController.text =
                                      newTime.format(context) +
                                          (newTime.hour >= 12 ? " PM" : " AM");
                                });
                              }
                            },
                      child: makeUserInput(
                        enabled: false,
                        prefix_icon_data: Icons.hourglass_bottom_rounded,
                        text_controller: _endTimeController,
                        hint_text: "End Time",
                      ),
                    ),
                  ),
                ],
              ),
              Space(spaceY: 10),
              SizedBox(
                width: width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    saveEvent().then((value) {
                      print("saved");
                    }).catchError((err) {
                      print(err.toString());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.gradient_color2,
                  ),
                  icon: Icon(
                    Icons.save_rounded,
                    color: CustomColors.primary_light,
                  ),
                  label: Text(
                    "SAVE",
                    style: TextStyle(
                      fontSize: CustomSize.size(width, height, 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
