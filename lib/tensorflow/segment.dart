import 'dart:math';

class Complex {
  Complex(this.re, this.im);

  final double re;
  final double im;

  double abs() => sqrt(re * re + im * im);
}

extension ListEx on List<(double, double)> {
  List<double> get feature {
    final meanRms = map((x) => x.$2).reduce((a, b) => a + b) / length;
    final stdRms = sqrt(map((x) => pow(x.$2 - meanRms, 2)).reduce((a, b) => a + b) / (length - 1));
    final maxRms = map((x) => x.$2).reduce(max);
    final minRms = map((x) => x.$2).reduce(min);
    final skewRms = map((x) => pow(x.$2 - meanRms, 3)).reduce((a, b) => a + b) / ((length - 1) * pow(stdRms, 3));
    final kurtosisRms = map((x) => pow(x.$2 - meanRms, 4)).reduce((a, b) => a + b) / ((length - 1) * pow(stdRms, 4)) - 3;

    final dtArr = [for (var i = 0; i < length - 1; i++) this[i + 1].$1 - this[i].$1];
    final fs = dtArr.isNotEmpty ? 1.0 / (dtArr.reduce((a, b) => a + b) / dtArr.length) : 1.0;
    final detrended = map((x) => x.$2 - (map((x) => x.$2).reduce((a, b) => a + b) / length)).toList();
    final spectrum = List<Complex>.generate(
      length ~/ 2 + 1,
      (k) {
        var real = 0.0;
        var imag = 0.0;
        for (var n = 0; n < length; n++) {
          final angle = -2 * pi * k * n / length;
          real += detrended[n] * cos(angle);
          imag += detrended[n] * sin(angle);
        }
        return Complex(real, imag);
      },
    );

    final yf = spectrum.map((c) => c.abs()).toList(growable: false);
    final xf = List<double>.generate(yf.length, (i) => i * fs / length, growable: false);
    final dominantIdx = yf.indexWhere((amp) => amp == yf.reduce((a, b) => a > b ? a : b));
    final dominantFreq = xf[dominantIdx];

    final psd = yf.map((x) => x * x).toList();
    final psdSum = psd.reduce((a, b) => a + b);
    var spectralEntropy = 0.0;
    if (psdSum > 0) {
      final psdNorm = psd.map((p) => p / psdSum).toList();
      spectralEntropy = -psdNorm.map((pn) => pn * log(pn + 1e-12)).reduce((a, b) => a + b);
    }

    return [
      meanRms,
      stdRms,
      maxRms,
      minRms,
      skewRms,
      kurtosisRms,
      dominantFreq,
      spectralEntropy,
      length.toDouble(),
    ];
  }
}
