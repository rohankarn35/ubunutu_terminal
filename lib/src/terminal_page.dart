import 'package:flutter/material.dart';
import 'package:ubunutu_terminal/src/window_action_button.dart';

class TerminalPage extends StatefulWidget {
  final String terminalPrompt; // User-defined terminal prompt
  final Map<String, String> commands; // User-defined commands and their replies

  const TerminalPage({
    super.key,
    required this.terminalPrompt,
    required this.commands,
  });

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _terminalController = TextEditingController();
  final FocusNode _terminalFocusNode = FocusNode();
  final List<Map<String, String>> _history = [
    {'prompt': '', 'command': "Type help to know more"}
  ]; // To store command and output history

  double _widthFactor = 0.8;
  double _heightFactor = 0.8;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _terminalFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _terminalController.dispose();
    _terminalFocusNode.dispose();
    super.dispose();
  }

  void _executeCommand(String command) {
    String response;
    if (widget.commands.containsKey(command.trim())) {
      response = widget.commands[command.trim()]!;
    } else if (command.trim() == 'clear') {
      setState(() {
        _history.clear();
      });
      _terminalController.clear();
      return;
    } else {
      response = "command not found";
    }

    setState(() {
      _history
          .add({'prompt': '${widget.terminalPrompt}: ~\$', 'command': command});
      _history.add({'prompt': '', 'command': response});
    });

    _terminalController.clear();
  }

  void _restoreFocus() {
    if (!_terminalFocusNode.hasFocus) {
      _terminalFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final terminalWidth = screenSize.width * _widthFactor;
    final terminalHeight = screenSize.height * _heightFactor;

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _restoreFocus,
          child: Stack(
            children: [
              Container(
                width: terminalWidth,
                height: terminalHeight,
                decoration: BoxDecoration(
                  color: Color(0xFF4B003A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: terminalWidth,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                '${widget.terminalPrompt}: ~',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                          WindowActionButton(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var entry in _history)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (entry['prompt']!.isNotEmpty)
                                      Text(
                                        entry['prompt']!,
                                        style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 14),
                                      ),
                                    if (entry['command']!.isNotEmpty)
                                      Expanded(
                                        child: Text(
                                          ' ${entry['command']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                  ],
                                ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${widget.terminalPrompt}: ~\$ ',
                                    style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 14),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _terminalController,
                                      focusNode: _terminalFocusNode,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      cursorColor: Colors.white,
                                      cursorWidth: 6,
                                      autofocus: true,
                                      maxLines: 1,
                                      onSubmitted: (value) {
                                        _executeCommand(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
