import 'package:flutter/material.dart';

@immutable
class CardUiTokens extends ThemeExtension<CardUiTokens> {
  const CardUiTokens({
    required this.isCompact,
    required this.cardHeaderFontWeight,
    required this.cardHeaderFontSize,
    required this.metadataChipAlpha,
    required this.metadataIconSizeCompact,
    required this.metadataIconSizeRegular,
    required this.containerOutlineAlpha,
  });

  final bool isCompact;
  final FontWeight cardHeaderFontWeight;
  final double cardHeaderFontSize;
  final double metadataChipAlpha;
  final double metadataIconSizeCompact;
  final double metadataIconSizeRegular;
  final double containerOutlineAlpha;

  static const CardUiTokens _regular = CardUiTokens(
    isCompact: false,
    cardHeaderFontWeight: FontWeight.w700,
    cardHeaderFontSize: 18,
    metadataChipAlpha: 0.55,
    metadataIconSizeCompact: 12,
    metadataIconSizeRegular: 13,
    containerOutlineAlpha: 0.55,
  );

  static const CardUiTokens _compact = CardUiTokens(
    isCompact: true,
    cardHeaderFontWeight: FontWeight.w700,
    cardHeaderFontSize: 18,
    metadataChipAlpha: 0.55,
    metadataIconSizeCompact: 12,
    metadataIconSizeRegular: 13,
    containerOutlineAlpha: 0.55,
  );

  factory CardUiTokens.regular() => _regular;

  factory CardUiTokens.compact() => _compact;

  @override
  CardUiTokens copyWith({
    bool? isCompact,
    FontWeight? cardHeaderFontWeight,
    double? cardHeaderFontSize,
    double? metadataChipAlpha,
    double? metadataIconSizeCompact,
    double? metadataIconSizeRegular,
    double? containerOutlineAlpha,
  }) {
    return CardUiTokens(
      isCompact: isCompact ?? this.isCompact,
      cardHeaderFontWeight: cardHeaderFontWeight ?? this.cardHeaderFontWeight,
      cardHeaderFontSize: cardHeaderFontSize ?? this.cardHeaderFontSize,
      metadataChipAlpha: metadataChipAlpha ?? this.metadataChipAlpha,
      metadataIconSizeCompact:
          metadataIconSizeCompact ?? this.metadataIconSizeCompact,
      metadataIconSizeRegular:
          metadataIconSizeRegular ?? this.metadataIconSizeRegular,
      containerOutlineAlpha:
          containerOutlineAlpha ?? this.containerOutlineAlpha,
    );
  }

  @override
  CardUiTokens lerp(ThemeExtension<CardUiTokens>? other, double t) {
    if (other is! CardUiTokens) return this;
    return CardUiTokens(
      isCompact: t < 0.5 ? isCompact : other.isCompact,
      cardHeaderFontWeight: t < 0.5
          ? cardHeaderFontWeight
          : other.cardHeaderFontWeight,
      cardHeaderFontSize: _lerpDouble(
        cardHeaderFontSize,
        other.cardHeaderFontSize,
        t,
      ),
      metadataChipAlpha: _lerpDouble(
        metadataChipAlpha,
        other.metadataChipAlpha,
        t,
      ),
      metadataIconSizeCompact: _lerpDouble(
        metadataIconSizeCompact,
        other.metadataIconSizeCompact,
        t,
      ),
      metadataIconSizeRegular: _lerpDouble(
        metadataIconSizeRegular,
        other.metadataIconSizeRegular,
        t,
      ),
      containerOutlineAlpha: _lerpDouble(
        containerOutlineAlpha,
        other.containerOutlineAlpha,
        t,
      ),
    );
  }
}

double _lerpDouble(double a, double b, double t) => a + (b - a) * t;

extension CardUiTokensX on BuildContext {
  CardUiTokens get cardUi =>
      Theme.of(this).extension<CardUiTokens>() ?? CardUiTokens.regular();
}
