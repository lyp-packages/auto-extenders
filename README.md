# auto-extenders: Automatic lyrics line extenders for Lilypond

This package provides a command to automatically create line extenders for lyrics in melismatic music.

The code is based on work by Knut Petersen and Alexander Kobel, [as discussed](http://lilypond.1069038.n5.nabble.com/music-function-to-be-included-somewhere-in-scm-td197960.html) on the lilypond-dev mailing list.

## Installation

```bash
lyp install auto-extenders
```

## Usage

```lilypond
\require "auto-extenders"

...
\new Lyrics {
  \autoextenders {
    Und die ei- nen _ _ _
  }
}
...
```

For more details, see the [included example](test/extenders-test.ly).