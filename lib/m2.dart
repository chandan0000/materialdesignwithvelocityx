import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Color greenTouch = Vx.hexToColor("#788154");

class M2 extends StatelessWidget {
  const M2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.hexToColor(
        "#e8eddb",
      ),
      body: SafeArea(
        child: Column(
          children: [
            // cleneder view
            const CalenderView()
                .p24()
                .h(context.percentHeight * (Vx.isWeb ? 33 : 30)),
            // music player view
            const MusicPlayerView().p24(),
            // chat view
            const ChatView().p24(),
          ],
        ).scrollVertical(),
      ),
      // bittombar view
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "https://avatars.githubusercontent.com/u/60910265?v=4"
            .circularNetworkImage(radius: 32),
        10.widthBox,
        Column(
          children: [
            const Text("Material 3").text.bold.make(),
            const Text("Check this out").text.caption(context).make(),
          ],
        ).box.p16.roundedLg.color(Vx.hexToColor("#fff6db")).make(),
      ],
    );
  }
}

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      child: Column(
        children: [
          VxCapsule(
            height: 28,
            width: 120,
            backgroundColor: Vx.hexToColor("#c4ecd4"),
            child: HStack(
              [
                const Icon(
                  Icons.phone_android,
                ).scale50(),
                const Text("Phone Speaker").text.xs.make()
              ],
            ),
          ).objectCenterRight(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxBox()
                  .square(90)
                  .bgImage(
                    const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1684868623430-aa353b5da28d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1228&q=80"),
                    ),
                  )
                  .rounded
                  .make(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Song Name right here").text.semiBold.make(),
                  const Text("aritst Name right here").text.sm.make()
                ],
              ).pSymmetric(
                h: 16,
                v: 12,
              )
            ],
          ),
          Slider(
            inactiveColor: Vx.black,
            activeColor: Vx.black,
            onChanged: (value) {},
            value: 25,
            min: 0,
            max: 100,
          ),
          HStack(
            [
              const Text("1:20").text.make(),
              const Spacer(),
              const Text("3:20").text.make(),
            ],
          ).px24(),
          const HStack(
            [
              Icon(
                Icons.shuffle,
              ),
              Spacer(),
              Icon(
                Icons.skip_previous,
              ),
              Spacer(),
              Icon(
                Icons.play_arrow,
              ),
              Spacer(),
              Icon(
                Icons.skip_next,
              ),
              Spacer(),
              Icon(
                Icons.repeat,
              ),
            ],
          )
        ],
      ),
    ).wFull(context);
  }
}

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      child: Row(
        children: [
          VStack(
            [
              "MAY".text.xl4.thin.tighter.make(),
              "28"
                  .text
                  .xl6
                  .size(19)
                  .tightest
                  .bold
                  .color(
                    Vx.hexToColor("#595236"),
                  )
                  .fontFamily(GoogleFonts.poppins().fontFamily!)
                  .make(),
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          const Spacer(),
          VStack(
            [
              VxCapsule(
                height: 30,
                width: context.percentWidth * 50,
                backgroundColor: greenTouch,
                child: const Text("Google I/O 23")
                    .text
                    .white
                    .make()
                    .px12()
                    .objectCenterLeft(),
              ),
              const Spacer(),
              VStack([
                const Text("Stand Up").text.semiBold.make(),
                const Text("10:00 - 10:30 AM").text.make()
              ])
                  .box
                  .border(
                    color: greenTouch,
                    width: 3,
                  )
                  .p16
                  .rounded
                  .width(
                    context.percentWidth * 50,
                  )
                  .make(),
              const Spacer(),
              VxCapsule(
                height: 30,
                width: context.percentWidth * 50,
                backgroundColor: Vx.yellow200,
                child: const Text("Happy Hour")
                    .text
                    .black
                    .make()
                    .px12()
                    .objectCenterLeft(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: greenTouch,
              child: const Icon(Icons.add),
            ),
            const GreenIcon(
              icon: Icons.mic,
            ),
            const GreenIcon(
              icon: Icons.bookmark_outlined,
            ),
            const GreenIcon(
              icon: Icons.calendar_today,
            ),
            const GreenIcon(
              icon: Icons.brush,
            ),
          ],
        ),
      ).p24(),
    );
  }
}

class GreenIcon extends StatelessWidget {
  final IconData icon;
  const GreenIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: greenTouch,
    );
  }
}

class RoundedBox extends StatelessWidget {
  final Widget child;
  const RoundedBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: child,
    )
        .color(
          Vx.hexToColor("#fff6db"),
        )
        .roundedLg
        .p24
        .make();
  }
}
