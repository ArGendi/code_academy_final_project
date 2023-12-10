import 'package:code_academy_auth/controllers/resturants/resturants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ResturantsCubit>(context).getAllResturnats();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ResturantsCubit>(context);
    return BlocBuilder<ResturantsCubit, ResturantsState>(
      builder: (context, state) {
        if(state is LoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is SuccessState){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              itemBuilder: (context, i) {
                return Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Image.network(
                            cubit.resturants[i].pic!,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.resturants[i].name.toString()),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(Icons.timer, size: 20,),
                                  SizedBox(width: 5,),
                                  Text(cubit.resturants[i].deliveryTime.toString())
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: cubit.resturants.length,
            ),
          );
        }
        else{
          return Center(child: Text("No Data for now"),);
        }
        
      },
    );
  }
}
