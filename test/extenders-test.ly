\version "2.19"

\pinclude "../package.ly"

\score {
  <<
    \new Staff <<
      \new Voice = "melody" \relative {
        \voiceOne
        e'4 e8 e c4 c
        | c e8 d c2
      }
      \new Voice = "splitpart" \relative {
        \voiceTwo
        e'4 c c c
        | c c c2
      }
    >>
    \new Lyrics \lyricsto "melody" {
      They shall not o -- ver -- come,
      shall _ not!
    }
    \new Lyrics \lyricsto "splitpart" {
      \set stanza = "no extenders (old default)"
      We will _ _ _
      will _
    }
    \new Lyrics \lyricsto "splitpart" {
      \autoextenders {
        \set stanza = "with extenders"
        We will _ _ _
        will _
      }
    }
    \new Lyrics \lyricsto "splitpart" {
      \autoextenders {
        \set stanza = "with extenders, plus corrections"
        We __ \once \override LyricText.self-alignment-X = #LEFT will __ \markup{\null} _ _
        \once \override LyricText.self-alignment-X = #LEFT will __ "" _
      }
    }
  >>
}
