import 'package:flutter/material.dart';

@immutable
class LayoutTokens extends ThemeExtension<LayoutTokens> {
  const LayoutTokens({
    required this.isCompact,
    required this.micro,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.media,
    required this.footer,
    required this.listItemGap,
    required this.chipPaddingHorizontal,
    required this.chipPaddingVertical,
    required this.chipIconGap,
    required this.chipLabelHorizontal,
    required this.cardPaddingHorizontal,
    required this.cardPaddingTop,
    required this.cardPaddingBottom,
    required this.sectionGap,
    required this.cardInnerHorizontal,
    required this.cardInnerVertical,
    required this.sectionInsetHorizontal,
    required this.sectionInsetTop,
    required this.sectionInsetBottom,
    required this.loadingHorizontal,
    required this.loadingVertical,
    required this.radiusContainer,
    required this.radiusMedia,
    required this.radiusPill,
  });

  final bool isCompact;
  final double micro;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double xxxl;
  final double media;
  final double footer;

  final double listItemGap;
  final double chipPaddingHorizontal;
  final double chipPaddingVertical;
  final double chipIconGap;
  final double chipLabelHorizontal;

  final double cardPaddingHorizontal;
  final double cardPaddingTop;
  final double cardPaddingBottom;
  final double sectionGap;
  final double cardInnerHorizontal;
  final double cardInnerVertical;
  final double sectionInsetHorizontal;
  final double sectionInsetTop;
  final double sectionInsetBottom;
  final double loadingHorizontal;
  final double loadingVertical;

  final double radiusContainer;
  final double radiusMedia;
  final double radiusPill;

  static const LayoutTokens _regular = LayoutTokens(
    isCompact: false,
    micro: 2,
    xs: 4,
    sm: 6,
    md: 8,
    lg: 10,
    xl: 12,
    xxl: 14,
    xxxl: 16,
    media: 20,
    footer: 24,
    listItemGap: 7,
    chipPaddingHorizontal: 9,
    chipPaddingVertical: 5,
    chipIconGap: 5,
    chipLabelHorizontal: 10,
    cardPaddingHorizontal: 16,
    cardPaddingTop: 10,
    cardPaddingBottom: 14,
    sectionGap: 12,
    cardInnerHorizontal: 14,
    cardInnerVertical: 12,
    sectionInsetHorizontal: 12,
    sectionInsetTop: 9,
    sectionInsetBottom: 11,
    loadingHorizontal: 16,
    loadingVertical: 8,
    radiusContainer: 16,
    radiusMedia: 20,
    radiusPill: 999,
  );

  static const LayoutTokens _compact = LayoutTokens(
    isCompact: true,
    micro: 2,
    xs: 4,
    sm: 6,
    md: 8,
    lg: 10,
    xl: 12,
    xxl: 14,
    xxxl: 16,
    media: 20,
    footer: 24,
    listItemGap: 6,
    chipPaddingHorizontal: 8,
    chipPaddingVertical: 4,
    chipIconGap: 4,
    chipLabelHorizontal: 8,
    cardPaddingHorizontal: 12,
    cardPaddingTop: 8,
    cardPaddingBottom: 12,
    sectionGap: 10,
    cardInnerHorizontal: 12,
    cardInnerVertical: 10,
    sectionInsetHorizontal: 10,
    sectionInsetTop: 8,
    sectionInsetBottom: 10,
    loadingHorizontal: 16,
    loadingVertical: 8,
    radiusContainer: 14,
    radiusMedia: 20,
    radiusPill: 999,
  );

  factory LayoutTokens.regular() => _regular;

  factory LayoutTokens.compact() => _compact;

  @override
  LayoutTokens copyWith({
    bool? isCompact,
    double? micro,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? xxxl,
    double? media,
    double? footer,
    double? listItemGap,
    double? chipPaddingHorizontal,
    double? chipPaddingVertical,
    double? chipIconGap,
    double? chipLabelHorizontal,
    double? cardPaddingHorizontal,
    double? cardPaddingTop,
    double? cardPaddingBottom,
    double? sectionGap,
    double? cardInnerHorizontal,
    double? cardInnerVertical,
    double? sectionInsetHorizontal,
    double? sectionInsetTop,
    double? sectionInsetBottom,
    double? loadingHorizontal,
    double? loadingVertical,
    double? radiusContainer,
    double? radiusMedia,
    double? radiusPill,
  }) {
    return LayoutTokens(
      isCompact: isCompact ?? this.isCompact,
      micro: micro ?? this.micro,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      xxxl: xxxl ?? this.xxxl,
      media: media ?? this.media,
      footer: footer ?? this.footer,
      listItemGap: listItemGap ?? this.listItemGap,
      chipPaddingHorizontal:
          chipPaddingHorizontal ?? this.chipPaddingHorizontal,
      chipPaddingVertical: chipPaddingVertical ?? this.chipPaddingVertical,
      chipIconGap: chipIconGap ?? this.chipIconGap,
      chipLabelHorizontal: chipLabelHorizontal ?? this.chipLabelHorizontal,
      cardPaddingHorizontal:
          cardPaddingHorizontal ?? this.cardPaddingHorizontal,
      cardPaddingTop: cardPaddingTop ?? this.cardPaddingTop,
      cardPaddingBottom: cardPaddingBottom ?? this.cardPaddingBottom,
      sectionGap: sectionGap ?? this.sectionGap,
      cardInnerHorizontal: cardInnerHorizontal ?? this.cardInnerHorizontal,
      cardInnerVertical: cardInnerVertical ?? this.cardInnerVertical,
      sectionInsetHorizontal:
          sectionInsetHorizontal ?? this.sectionInsetHorizontal,
      sectionInsetTop: sectionInsetTop ?? this.sectionInsetTop,
      sectionInsetBottom: sectionInsetBottom ?? this.sectionInsetBottom,
      loadingHorizontal: loadingHorizontal ?? this.loadingHorizontal,
      loadingVertical: loadingVertical ?? this.loadingVertical,
      radiusContainer: radiusContainer ?? this.radiusContainer,
      radiusMedia: radiusMedia ?? this.radiusMedia,
      radiusPill: radiusPill ?? this.radiusPill,
    );
  }

  @override
  LayoutTokens lerp(ThemeExtension<LayoutTokens>? other, double t) {
    if (other is! LayoutTokens) return this;
    return LayoutTokens(
      isCompact: t < 0.5 ? isCompact : other.isCompact,
      micro: lerpDouble(micro, other.micro, t),
      xs: lerpDouble(xs, other.xs, t),
      sm: lerpDouble(sm, other.sm, t),
      md: lerpDouble(md, other.md, t),
      lg: lerpDouble(lg, other.lg, t),
      xl: lerpDouble(xl, other.xl, t),
      xxl: lerpDouble(xxl, other.xxl, t),
      xxxl: lerpDouble(xxxl, other.xxxl, t),
      media: lerpDouble(media, other.media, t),
      footer: lerpDouble(footer, other.footer, t),
      listItemGap: lerpDouble(listItemGap, other.listItemGap, t),
      chipPaddingHorizontal: lerpDouble(
        chipPaddingHorizontal,
        other.chipPaddingHorizontal,
        t,
      ),
      chipPaddingVertical: lerpDouble(
        chipPaddingVertical,
        other.chipPaddingVertical,
        t,
      ),
      chipIconGap: lerpDouble(chipIconGap, other.chipIconGap, t),
      chipLabelHorizontal: lerpDouble(
        chipLabelHorizontal,
        other.chipLabelHorizontal,
        t,
      ),
      cardPaddingHorizontal: lerpDouble(
        cardPaddingHorizontal,
        other.cardPaddingHorizontal,
        t,
      ),
      cardPaddingTop: lerpDouble(cardPaddingTop, other.cardPaddingTop, t),
      cardPaddingBottom: lerpDouble(
        cardPaddingBottom,
        other.cardPaddingBottom,
        t,
      ),
      sectionGap: lerpDouble(sectionGap, other.sectionGap, t),
      cardInnerHorizontal: lerpDouble(
        cardInnerHorizontal,
        other.cardInnerHorizontal,
        t,
      ),
      cardInnerVertical: lerpDouble(
        cardInnerVertical,
        other.cardInnerVertical,
        t,
      ),
      sectionInsetHorizontal: lerpDouble(
        sectionInsetHorizontal,
        other.sectionInsetHorizontal,
        t,
      ),
      sectionInsetTop: lerpDouble(sectionInsetTop, other.sectionInsetTop, t),
      sectionInsetBottom: lerpDouble(
        sectionInsetBottom,
        other.sectionInsetBottom,
        t,
      ),
      loadingHorizontal: lerpDouble(
        loadingHorizontal,
        other.loadingHorizontal,
        t,
      ),
      loadingVertical: lerpDouble(loadingVertical, other.loadingVertical, t),
      radiusContainer: lerpDouble(radiusContainer, other.radiusContainer, t),
      radiusMedia: lerpDouble(radiusMedia, other.radiusMedia, t),
      radiusPill: lerpDouble(radiusPill, other.radiusPill, t),
    );
  }
}

double lerpDouble(double a, double b, double t) => a + (b - a) * t;

extension LayoutTokensX on BuildContext {
  LayoutTokens get layout {
    return Theme.of(this).extension<LayoutTokens>() ?? LayoutTokens.regular();
  }
}
