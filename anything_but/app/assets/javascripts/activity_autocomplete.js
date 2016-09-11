$(function() {
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
});
