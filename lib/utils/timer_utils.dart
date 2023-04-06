class TimerUtils {
  int getTimeSeconds(int difficulty) {
    switch (difficulty) {
      case 1:
        return 60 * 7;
      case 2:
        return 60 * 5;
      default: // Nivel 3
        return 60 * 2;
    }
  }

  // Formata os segundos recebidos
  String getTimeFormat(int seconds) {
    var mins = (seconds ~/ 60);
    var secs = seconds % 60;

    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
