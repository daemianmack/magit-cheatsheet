;; Assign CSS during export.
(setq org-export-html-style "<style type=\"text/css\">

  html {font-family: Times, serif; font-size: 90%;}
  .preamble {font-variant: italic; margin-bottom:40px;}
  .title {text-align: center;}

  h2 {margin-top:40px;
      margin-bottom:1px;
      font-variant: small-caps;
      background-color:#A65B5B;
      color:#FFFFFF;
      font-size:1.5em;
      text-align:center;
  }

  table {border: 0px solid transparent; width:100%;}
  td {border-collapse:collapse; border: 1px solid #fff;}
  td, th {vertical-align: top;}
  td.command, td.description, td.notes {background-color: #F0E4E4;}
  td.command, td.description {white-space: nowrap;}
  td.command {font-family:monospace; font-size: 130%; font-weight: 600; width:10em;}
  td.notes {color: #666; font-variant: italic;}

</style>")


;; Insert preamble pointing to the manual proper and my blogpost so
;; user can regenerate this however they like.
(setq org-export-html-preamble "

<div class=\"preamble\">This is a distillation of the <a
href=\"http://magit.github.com/magit/magit.html\">Magit user
manual</a>, which has more detail than this quick cheatsheet
provides. Read the user manual! Blogpost containing materials to
regenerate this cheatsheet from scratch <a href="http://daemianmack.com/2009/09/24/magit-cheatsheet/">here</a>.</div>


")


;; search-and-replace macro to assign necessary CSS classes to the TD
;; elements after export.
(fset 'classify-tds
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("^S<tr><td>^MD class=\"command\"^S<td>^MD class=\"description\"^S^SCD ^?D class=\"notes\"^A^N" 0 "%d")) arg)))


