import 'package:bside/service/api/api_service.dart';
import 'package:bside/service/model/location_model.dart';
import 'package:bside/widget/commission/commission_location_example.dart';
import 'package:bside/widget/public/my_app_bar.dart';
import 'package:flutter/material.dart';

class CommissionLocationScreen extends StatefulWidget {
  CommissionLocationScreen({
    super.key,
    required this.setLocationModel,
  });
  Future<List<LocationModel>> locationList = ApiService.getLocation();
  dynamic setLocationModel;

  @override
  State<CommissionLocationScreen> createState() =>
      _CommissionLocationScreenState();
}

class _CommissionLocationScreenState extends State<CommissionLocationScreen> {
  var textController = TextEditingController();
  String locationValue = '';
  late LocationModel selectLocation;
  bool isSelect = false;
  String address = '';

  void setLocationValue({required String value}) {
    setState(() {
      locationValue = value;
    });
  }

  void selectLocationAction({required LocationModel selectItem}) {
    setState(() {
      selectLocation = selectItem;
      isSelect = true;
    });
  }

  void setAdress({required String value}) {
    setState(() {
      address = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        titleText: '주소 검색',
      ),
      bottomSheet: isSelect == true
          ? CommissionLocationBottomBtn(
              setLocationModel: widget.setLocationModel,
              selectLocation: selectLocation,
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: isSelect == true
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectLocation.main,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      selectLocation.sub,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: ((value) {
                        setAdress(value: value);
                      }),
                      decoration: InputDecoration(
                        hintText: '상세주소 입력',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextField(
                      onChanged: (value) {
                        setLocationValue(value: value);
                      },
                      controller: textController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            textController.clear();
                          },
                          icon: Icon(
                            locationValue.isNotEmpty
                                ? Icons.cancel
                                : Icons.search,
                            color: Colors.black54,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                        ),
                        hintText: '플레이스 홀더',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  ),
                  locationValue.isNotEmpty
                      ? FutureBuilder(
                          future: widget.locationList,
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  for (var location in snapshot.data!)
                                    SelectLocation(
                                        location: location,
                                        selectLocationAction:
                                            selectLocationAction),
                                ],
                              );
                            }
                            return const ExampleContainer();
                          }))
                      : const ExampleContainer()
                ],
              ),
      ),
    );
  }
}

class SelectLocation extends StatelessWidget {
  final dynamic selectLocationAction;

  const SelectLocation({
    Key? key,
    required this.location,
    required this.selectLocationAction,
  }) : super(key: key);

  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectLocationAction(selectItem: location);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(.05),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.main,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              location.sub,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CommissionLocationBottomBtn extends StatelessWidget {
  final dynamic setLocationModel;
  final LocationModel selectLocation;
  const CommissionLocationBottomBtn({
    Key? key,
    required this.setLocationModel,
    required this.selectLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setLocationModel(locationVal: selectLocation);
          Navigator.pop(context);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15)),
        ),
        child: const Text(
          '완료',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
