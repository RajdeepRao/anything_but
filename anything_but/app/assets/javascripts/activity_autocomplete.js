$(function() {
<<<<<<< HEAD
    var availableTags = [
        "ActionScript",         "AppleScript",
        "Asp",              "BASIC",
        "C",                "C++",
        "Clojure",              "COBOL",
        "ColdFusion",           "Erlang",
        "Fortran",              "Groovy",
        "Haskell",              "Java",
        "JavaScript",           "Lisp",
        "Perl",             "PHP",
        "Python",               "Ruby",
        "Scala",                "Scheme"
    ];
    $( "#do-not-want" ).autocomplete({
        source: availableTags
    });
=======
  $("#do-not-want").autocomplete({
    source: 'activities',
  });
>>>>>>> 406e87a1a66eb75964da7871917cc3f1f24248e2
});
