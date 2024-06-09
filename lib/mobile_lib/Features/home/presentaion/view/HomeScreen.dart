import 'dart:typed_data';

import 'package:cece/core/app_export.dart';
import 'package:cece/data/models/collaborator_model.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/mobile_lib/Features/Tabs/presentaion/manger/tabs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_network/image_network.dart';
import 'package:readmore/readmore.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key,required this.conference}) : super(key: key);
  OrganizerEvents? conference ;



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   @override
  Widget build(BuildContext context) {

     List<CollaboratorModel> collaborators = (widget.conference?.speakers??[]) +
      (widget.conference?.presenters??[]) +( widget.conference?.participants??[]) + (widget.conference?.authors??[]) +
      (widget.conference?.moderators??[]);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.conference?.conferenceDetails?.conferenceName ?? '',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Visibility(
                            visible: widget.conference?.conferenceDetails?.image == null,
                            child: Image.memory(
                              widget.conference?.conferenceDetails?.imageFile?? Uint8List(0),
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 200.0,
                            ),
                          ),
                          Visibility(
                            visible:widget.conference?.conferenceDetails?.image != null,
                            child: SizedBox(
                              height: 250,
                              child: Center(
                                child: ClipRRect(
                                  child:ImageNetwork(
                                    image: widget.conference?.conferenceDetails?.image??'',
                                    height: 250,
                                    width: 250,
                                    duration: 1500,
                                    curve: Curves.easeIn,
                                    onPointer: true,
                                    debugPrint: false,
                                    fullScreen: false,
                                    fitAndroidIos: BoxFit.cover,
                                    fitWeb: BoxFitWeb.cover,
                                    borderRadius: BorderRadius.circular(70),
                                    onLoading: const CircularProgressIndicator(
                                      color: Colors.indigoAccent,
                                    ),
                                    onError: const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      debugPrint("©gabriel_patrick_souza");
                                    },
                                  ),
                                ),

                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1.5,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1.5,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                           Row(
                             children: [
                               Text(
                                 'City: ',
                                 style: TextStyle(
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold,
                                 )
                               ),
                               Text(
                                widget.conference?.conferenceDetails
                                    ?.city ??
                                    '',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                               ),
                             ],
                           ),
                           Row(
                             children: [
                               Text(
                                 'Venue: ',
                                 style: TextStyle(
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.bold,
                                 )
                               ),
                               Text(
                                widget.conference?.conferenceDetails
                                    ?.venue ??
                                    '',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                               ),
                             ],
                           ),
                          Row(
                            children: [
                              const Text('from : ',
                                  style:   TextStyle(fontSize: 16.0,
                                    fontWeight: FontWeight.bold ,)
                              ),
                              Text( widget.conference?.conferenceDetails?.startDate??'',
                                style: const TextStyle(fontSize: 16.0,),
                              ),
                              const SizedBox(width: 10.0,),
                              const Text('to : ',
                                  style:   TextStyle(fontSize: 16.0,
                                    fontWeight: FontWeight.bold ,)
                              ),
                              Text(widget.conference?.conferenceDetails?.endDate??'',
                                style: const TextStyle(fontSize: 16.0,),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ) ,
                          ReadMoreText(
                            widget.conference?.conferenceDetails
                                    ?.conferenceDescription ??
                                '',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                            trimLength: 60,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1.5,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                'Registration Ceremony',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1.5,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: [
                              Wrap(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.conference
                                            ?.registrationCeremony?.startDate ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.timer),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.conference
                                            ?.registrationCeremony?.startTime ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.  conference?.registrationCeremony?.hall ?? '',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1.5,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                'Closing Ceremony',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  height: 1.5,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: [
                              Wrap(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.conference?.closingCeremony?.startDate ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.timer),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.conference?.closingCeremony?.startTime ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.  conference?.closingCeremony?.hall ?? '',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    'Collaborator',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: Colors.grey.shade400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50.0,
                child: Visibility(
                  visible: collaborators.isNotEmpty ?? false,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      itemBuilder: (context, index) {
                        var speaker = collaborators[index];
                        return InkWell(
                          onTap: () {
                            // dialog to show collaborator data
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Collaborator Profile',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Iconsax.personalcard),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Name : ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                speaker?.firstName ??
                                                    '' +
                                                        ' ' +
                                                        speaker!.lastName
                                                            .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.email_outlined),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  'Email : ',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  speaker?.email ?? '',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ])
                                        ]),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Close'))
                                    ],
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Iconsax.personalcard),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  speaker?.firstName ??
                                      '' + ' ' + speaker!.lastName.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20.0,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.conference?.speakers?.length ?? 0),
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ));
  }

}

class ImageWidget extends StatelessWidget {
  const ImageWidget({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ), ),
    );
  }
}