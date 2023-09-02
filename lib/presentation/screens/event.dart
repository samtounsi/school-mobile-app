import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocEvent/cubit.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocEvent/state.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:mobile_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'addEventTeacher.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    EventCubit.get(context).getListEvent(id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Wallpaper 2.png',
              ),
              fit: BoxFit.fill)),
      child: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          if (state is DeleteEventSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.aqua,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "delete event success",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
              width: MediaQuery.of(context).size.width - 10,
            ));
            EventCubit.get(context).getListEvent(id!);
          } else if (state is EventSuccessState) {}
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! EventLoadingState,
            builder: (BuildContext context) {
              var modelEvent = EventCubit.get(context).event!.reversed.toList();
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            DateTime date =
                                DateTime.parse(modelEvent[index].eventDate);
                            String formattedDate =
                                "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";

                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 340,
                                height: 300,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0x3A75A4FF),
                                        spreadRadius: 5)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10), //10
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        if (modelEvent[index].userId == id)
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        title: Text(
                                                            "Are you sure?"),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'cancel',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                EventCubit.get(
                                                                        context)
                                                                    .deleteEventTeacher(
                                                                        modelEvent[index]
                                                                            .id);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'delete',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15))),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 40,
                                                    color: AppColors.darkBlue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: AppColors.lightOrange,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                modelEvent[index].title,
                                                style: TextStyle(
                                                    color: AppColors.darkBlue,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                modelEvent[index].description,
                                                // softWrap: false,
                                                style: TextStyle(
                                                    color: AppColors.darkBlue,
                                                    fontSize: 18),
                                                maxLines: null,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 60),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ' $formattedDate',
                                                style: TextStyle(
                                                    color: AppColors.darkBlue,
                                                    fontSize: 22),
                                              ),
                                              Text(
                                                modelEvent[index].eventTime,
                                                style: TextStyle(
                                                    color: AppColors.darkBlue,
                                                    fontSize: 22),
                                              )
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        // if (modelEvent[index].userId == id)
                                        //   Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.end,
                                        //     children: [
                                        //       IconButton(
                                        //         onPressed: () {
                                        //           EventCubit.get(context).deleteEventTeacher(modelEvent[index].id);
                                        //
                                        //         },
                                        //         icon: Icon(
                                        //           Icons.delete,
                                        //           size: 40,
                                        //           color: AppColors.darkBlue,
                                        //         ),
                                        //       )
                                        //     ],
                                        //   )
                                      ],
                                    )),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: modelEvent!.length)),
                  if (type == "teacher")
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 10),
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: AppColors.aqua),
                          child: IconButton(
                            onPressed: () {
                              navigateTo(context, AddEventTeacher());
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColors.darkBlue,
                              size: 30,
                            ),
                          )),
                    ),
                ],
              );
            },
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
