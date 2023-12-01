import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

import '../../models/character.dart';
import '../../utils/string_ext.dart';
import '../view/image_view.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  final Character character;

  const DetailsPage({super.key, required this.character});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ScrollController _scrollController = ScrollController();

  bool _scrollable = false;

  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scrollable = _scrollController.position.maxScrollExtent > 0;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: context.router.pop,
              child: const Padding(
                padding: EdgeInsets.only(left: 16, top: 24),
                child: Icon(Icons.arrow_back_ios, size: 36),
              ),
            ),
            Expanded(child: _buildCharacterCard(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thickness: 12,
      radius: const Radius.circular(8),
      thumbVisibility: _scrollable ? true : false,
      child: Padding(
        padding: _scrollable
            ? const EdgeInsets.fromLTRB(16, 24, 24, 0)
            : const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: IgnorePointer(
            child: Tilt(
              tiltConfig: const TiltConfig(
                angle: 36,
                enableGestureTouch: false,
                enableGestureHover: false,
              ),
              shadowConfig: const ShadowConfig(disable: true),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(width: 8),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF42C7F4),
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: widget.character.firstUrl,
                      child: ImageView(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        url: widget.character.icon.url,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      widget.character.firstUrl.extractNameFromUrl(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.character.text,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
