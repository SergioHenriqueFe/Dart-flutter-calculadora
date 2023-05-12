
class Memory {
  static const operations = ['%', '/', 'x', '-', '+', '='];

  String _value = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String operation;
  bool wipeValeu = false;
  String _lastCommand = '';

  Memory({
    
    
    this.operation = '',
    this.wipeValeu =false
    
  });

  void applycommand(String command) {
    if (isReplacingOperation(command)) {
      _operation = command;
      return;
    }
    if (command == 'AC') {
      allCrear();
    } else if (operations.contains(command)) {
      setOperation(command);
    } else {
      addDigito(command);
    }
    _lastCommand = command;
  }

  isReplacingOperation(String command) {
    return operations.contains(_lastCommand) && operations.contains(command)
    && _lastCommand != '=' && command != '=';
  }

  setOperation(String newOperation) {
    if (_bufferIndex == 0) {
      _operation = newOperation;
      _bufferIndex = 1;
    } else {
      _buffer[0] = calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('')[0] : _value;

      bool isEqualsin = newOperation == '=';
      _operation = isEqualsin ? '' : newOperation;
      _bufferIndex = isEqualsin ? 0 : 1;
    }
    wipeValeu = true;
  }

  addDigito(String digito) {
    final isDot = digito == '.';
    final wipeValue = (_value == '0' && !isDot) || wipeValeu;

    if (isDot && valeu.contains('.') && !wipeValeu) {
      return;
    }
    final emptyValue = isDot ? '0' : '';
    final currentValuer = wipeValue ? '' : _value;
    _value = currentValuer + digito;
    wipeValeu = false;
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  allCrear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _operation = '';
    _bufferIndex = 0;
    wipeValeu = false;
  }

  calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  get valeu {
    return _value;
  }
}
