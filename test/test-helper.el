(--each  (--filter (s-match "dreamacs.*" it) (loop for x being the symbols
                                                   if (boundp x)
                                                   collect (symbol-name x))) (unintern it))
