(dreamacs-require-packages '(calfw)) 

(require 'calfw-cal)
(require 'calfw-ical)
(require 'calfw-org)

(defun steggy-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    (cfw:cal-create-source "Orange") ; diary source
    (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS
    ))) 

(provide 'dreamacs-calendar)
