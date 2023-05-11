class Memory {
  String value = '0';
  void applycommand(String command) {
    if (command == 'AC') {
      allCrear();
    }else
    value += command;
  }

  allCrear() {
    value = '0';
  }

  get valeu {
    return value;
  }
}
