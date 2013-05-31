

alto = \transpose c'' a \relative c''' {
  \Key
  \partial 2
  r2
  R1*16 |

  \mark "17"

  % 18
  ees8 f g4 f ees | d2. r4 | d8 ees f4 ees d | c2. r4 |
  % 22
  d8 ees f4 ees d4 | ees4 c f c | g' c, aes' c, | ees2 d |

  % 26
  ees8 f g4 f ees | d2. r4 | d8 ees f4 ees d | c2. r4 |
  % 30
  d8 ees f4 ees d4 | ees4 c f c | g' c, aes' c, | ees2 d | c1 |

  % 35

  \mark "34"

  \tempo 4 = 220
  ees4 ees ees ees | ees ees ees ees | des des des des | des des des des |
  ees4 ees ees ees | ees ees ees ees | des des des des | des des des des |

  \mark "42"

  % 43
  ees,2 ees4 f | ges2 bes | aes1 | r |
  ees2 ees4 f | ges2 bes | des1 | aes |
  % 51
  aes2 aes4 bes | b2 ees | des1 | r |
  aes2 aes4 bes | b2 ees | ges1 | des1 |

  \mark "58"

  r1 | r2. d4 | R1*2 |
  r1 | r2. d4 | R1*2 |
  r1 | r2. d4 | R1*2 |
  r1 | r2. d4 | R1*2 |

  \mark "74"

  s16*29 ees8. s16*61 ees8. s16*61 ees8. s16*61 ees8.
  s16*33 ees8. s16 ees4*100/120 s4*20/120 ees4*100/120 s4*20/120 ees4*100/120
  s4*20/120 |
  % 76
  ees4*100/120 s4*20/120 ees4*100/120 s4*20/120 ees4*100/120
  s4*20/120 ees4*100/120 s4*20/120 |
  % 77
  des4*100/120 s4*20/120 des4*100/120 s4*20/120 des4*100/120
  s4*20/120 des4*100/120 s4*20/120 |
  % 78
  des4*100/120 s4*20/120 des4*100/120 s4*20/120 des4*100/120
  s4*20/120 des4*100/120 s4*20/120 |
  % 79
  ees,16*7 s16 ees4*100/120 s4*20/120 f4*100/120 s4*20/120 |
  % 80
  ges16*7 s16 bes16*7 s16 |
  % 81
  aes16*15 s16*17 ees16*7 s16 ees4*100/120 s4*20/120 f4*100/120
  s4*20/120 |
  % 84
  ges16*7 s16 bes16*7 s16 |
  % 85
  des16*15 s16 |
  % 86
  aes16*15 s16*29 ees'8. s16*61 ees8. s16*61 ees8. s16*61 ees8.
  s16*161 ees8 s4. ees8 s8*5 ees8 s4. des8 s8*11 des8 s8*5 |
  % 115
  ees8 s4. ees8 s8*5 ees8 s4. des8 s8*11 des8 s8*5 |
  % 119
  ees8 s4. ees8 s8*5 ees8 s4. des8 s8*11 des8 s8*5 |
  % 123
  ees8 s4. ees8 s8*5 ees8 s4. des8 s8*11 des8 s8*5 |
  % 127
  ees8 s4. ees8 s8*5 ees8 s4. des8 s8*11 des8 s8*5 |
  % 131
  ees8 s4. ees8 s8*5 ees8 s4. des8 s8*11 des8 s8*5 |
  % 135
  ees'8 s4. ees8
}


altoSax = {

  \global
  \set Staff.instrumentName = #"Alto "

  \clef treble
  <<
    \alto
  >>
}
