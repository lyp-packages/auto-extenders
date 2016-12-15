#(begin
  ; TODO: extract event-related code into separate "events" package
  ; stuff like events:has-articulation?, events:prop-append etc

  (define (lyrics:has-articulation? event type)
    (find (lambda (a) (eq? (ly:music-property a 'name) type))
          (ly:music-property event 'articulations)))

  (define (lyrics:has-hyphen? event)
    (lyrics:has-articulation? event 'HyphenEvent))
  (define (lyrics:has-extender? event)
    (lyrics:has-articulation? event 'ExtenderEvent))

  (define (lyrics:add-extender! event)
    (ly:music-set-property! event 'articulations
      (append (ly:music-property event 'articulations)
              (list (make-music 'ExtenderEvent)))))
)

autoextenders =
#(define-music-function (lyrics) (ly:music?)
     (music-map
      (lambda (event)
        (if (and (eq? (ly:music-property event 'name) 'LyricEvent)
                 ; do not add extenders below hyphens
                 (not (lyrics:has-hyphen? event))
                 ; do not duplicate extenders
                 (not (lyrics:has-extender? event))
                 ; do not add additional extenders after _ (internally equivalent to " ")
                 ; to avoid killed extenders
                 (not (equal? (ly:music-property event 'text) " "))
                 ; do not add extenders after "" to allow ending extenders
                 ; within _ _ _ _ skip sequences with _ _ "" _ _
                 (not (equal? (ly:music-property event 'text) ""))
                 ; ditto, with _ _ \markup{|null} _ _
                 (not (equal? (ly:music-property event 'text) (markup #:null)))
                 )
            (lyrics:add-extender! event))
        event)
      lyrics))

