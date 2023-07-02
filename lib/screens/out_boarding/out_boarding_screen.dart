import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_page_indicator.dart';
import '../../widgets/out_boarding_content.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {

  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _pageIndex!=2,
                replacement: TextButton(
                  onPressed: ()=> Navigator.pushReplacementNamed(context, '/login_screen'),
                  child: const Text('START'),
                ),
                child: TextButton(
                  onPressed: (){
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  child: const Text('SKIP'),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int pageIndex){
                  setState(()=>_pageIndex=pageIndex);
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  OutBoardingContent(
                    imageName: 'images_1',
                    title: 'Welcome!',
                    subTitle: 'Now were up the big leagues gitting our turn at bat. The Bradly bunch that\'s the way we Bradly Bunch',
                  ),
                  OutBoardingContent(
                    imageName: 'images_2',
                    title: 'Add to card',
                    subTitle: 'Now were up the big leagues gitting our turn at bat. The Bradly bunch that\'s the way we Bradly Bunch',
                  ),
                  OutBoardingContent(
                    imageName: 'images_3',
                    title: 'Enjoy purchase!',
                    subTitle: 'Now were up the big leagues gitting our turn at bat. The Bradly bunch that\'s the way we Bradly Bunch',
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(
            //       backgroundColor: _pageIndex==0? Colors.orange : Colors.grey,
            //       borderColor:_pageIndex==0? Colors.grey : Colors.transparent,
            //       size: 10,
            //     ),
            //     TabPageSelectorIndicator(
            //       backgroundColor: _pageIndex==1? Colors.orange : Colors.grey,
            //       borderColor:_pageIndex==1? Colors.grey : Colors.transparent,
            //       size: 10,
            //     ),
            //     TabPageSelectorIndicator(
            //       backgroundColor: _pageIndex==2? Colors.orange : Colors.grey,
            //       borderColor:_pageIndex==2? Colors.grey : Colors.transparent,
            //       size: 10,
            //     ),
            //   ],
            // ),
            const SizedBox(height : 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPageIndicator(
                    currentPage: _pageIndex==0,
                  marginEnd: 14,
                ),
                CustomPageIndicator(
                    currentPage: _pageIndex==1,
                  marginEnd: 14,
                ),
                CustomPageIndicator(
                    currentPage: _pageIndex==2
                ),


              ],
            ),
            const SizedBox(height : 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (){
                    if(_pageIndex!=0) {
                      _pageController.previousPage
                        (duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutBack
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: (){
                    if(_pageIndex!=2) {
                      _pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutBack
                      );
                    }
                  },
                  icon:  const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            const SizedBox(height : 8),
            Visibility(
              visible: _pageIndex==2,
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: ()=> Navigator.pushReplacementNamed(context, '/login_screen'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text('START'),
                ),
              ),
            ),
            const SizedBox(height : 10),

          ],
        ),
      ),
    );
  }
}

