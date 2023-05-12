// ignore_for_file: public_member_api_docs, sort_constructors_first
class Memory {
  static const operations = ['%', '/', 'x', '-', '+', '='];

  String value = '0';
  final buffer = [0.0, 0.0];
  int bufferIndex = 0;
  String operation;
  bool wipeValeu = false;
  String lastCommand;

  Memory({
    required this.value,
    required this.bufferIndex,
    required this.operation,
    required this.wipeValeu,
    required this.lastCommand,
  });

  void applycommand(String command) {
    if (isReplacingOperation(command)) {
      operation = command;
      return;
    }
    if (command == 'AC') {
      allCrear();
    } else if (operations.contains(command)) {
      setOperation(command);
    } else {
      addDigito(command);
    }
    lastCommand = command;
  }

  isReplacingOperation(String command) {
    return operations.contains(lastCommand) && operations.contains(command)
    && lastCommand != '=' && command != '=';
  }

  setOperation(String newOperation) {
    if (bufferIndex == 0) {
      operation = newOperation;
      bufferIndex = 1;
    } else {
      buffer[0] = calculate();
      buffer[1] = 0.0;
      value = buffer[0].toString();
      value = value.endsWith('.0') ? value.split('')[0] : value;

      bool isEqualsin = newOperation == '=';
      operation = isEqualsin ? '' : newOperation;
      bufferIndex = isEqualsin ? 0 : 1;
    }
    wipeValeu = true;
  }

  addDigito(String digito) {
    final isDot = digito == '.';
    final wipeValue = (value == '0' && !isDot) || wipeValeu;

    if (isDot && valeu.contains('.') && !wipeValeu) {
      return;
    }
    final emptyValue = isDot ? '0' : '';
    final currentValuer = wipeValue ? '' : value;
    value = currentValuer + digito;
    wipeValeu = false;
    buffer[bufferIndex] = double.tryParse(value) ?? 0;
  }

  allCrear() {
    value = '0';
    buffer.setAll(0, [0.0, 0.0]);
    operation = '';
    bufferIndex = 0;
    wipeValeu = false;
  }

  calculate() {
    switch (operation) {
      case '%':
        return buffer[0] % buffer[1];
      case '/':
        return buffer[0] / buffer[1];
      case 'x':
        return buffer[0] * buffer[1];
      case '-':
        return buffer[0] - buffer[1];
      case '+':
        return buffer[0] + buffer[1];
      default:
        return buffer[0];
    }
  }

  get valeu {
    return value;
  }
}
