local entities = {
   amp      = "&";
   lt       = "<";
   gt       = ">";
   nbsp     = " ";
   iexcl    = "¡";
   cent     = "¢";
   pound    = "£";
   curren   = "¤";
   yen      = "¥";
   brvbar   = "¦";
   sect     = "§";
   uml      = "¨";
   copy     = "©";
   ordf     = "ª";
   laquo    = "«";
   ["not"]  = "¬";
   shy      = "­";
   reg      = "®";
   macr     = "¯";
   deg      = "°";
   plusmn   = "±";
   sup2     = "²";
   sup3     = "³";
   acute    = "´";
   micro    = "µ";
   para     = "¶";
   cedil    = "¸";
   sup1     = "¹";
   ordm     = "º";
   raquo    = "»";
   frac14   = "¼";
   frac12   = "½";
   frac34   = "¾";
   iquest   = "¿";
   times    = "×";
   divide   = "÷";
   forall   = "∀";
   part     = "∂";
   exist    = "∃";
   empty    = "∅";
   nabla    = "∇";
   isin     = "∈";
   notin    = "∉";
   ni       = "∋";
   prod     = "∏";
   sum      = "∑";
   minus    = "−";
   lowast   = "∗";
   radic    = "√";
   prop     = "∝";
   infin    = "∞";
   ang      = "∠";
   ["and"]  = "∧";
   ["or"]   = "∨";
   cap      = "∩";
   cup      = "∪";
   int      = "∫";
   there4   = "∴";
   sim      = "∼";
   cong     = "≅";
   asymp    = "≈";
   ne       = "≠";
   equiv    = "≡";
   le       = "≤";
   ge       = "≥";
   sub      = "⊂";
   sup      = "⊃";
   nsub     = "⊄";
   sube     = "⊆";
   supe     = "⊇";
   oplus    = "⊕";
   otimes   = "⊗";
   perp     = "⊥";
   sdot     = "⋅";
   Alpha    = "Α";
   Beta     = "Β";
   Gamma    = "Γ";
   Delta    = "Δ";
   Epsilon  = "Ε";
   Zeta     = "Ζ";
   Eta      = "Η";
   Theta    = "Θ";
   Iota     = "Ι";
   Kappa    = "Κ";
   Lambda   = "Λ";
   Mu       = "Μ";
   Nu       = "Ν";
   Xi       = "Ξ";
   Omicron  = "Ο";
   Pi       = "Π";
   Rho      = "Ρ";
   Sigma    = "Σ";
   Tau      = "Τ";
   Upsilon  = "Υ";
   Phi      = "Φ";
   Chi      = "Χ";
   Psi      = "Ψ";
   Omega    = "Ω";
   alpha    = "α";
   beta     = "β";
   gamma    = "γ";
   delta    = "δ";
   epsilon  = "ε";
   zeta     = "ζ";
   eta      = "η";
   theta    = "θ";
   iota     = "ι";
   kappa    = "κ";
   lambda   = "λ";
   mu       = "μ";
   nu       = "ν";
   xi       = "ξ";
   omicron  = "ο";
   pi       = "π";
   rho      = "ρ";
   sigmaf   = "ς";
   sigma    = "σ";
   tau      = "τ";
   upsilon  = "υ";
   phi      = "φ";
   chi      = "χ";
   psi      = "ψ";
   omega    = "ω";
   thetasym = "ϑ";
   upsih    = "ϒ";
   piv      = "ϖ";
   OElig    = "Œ";
   oelig    = "œ";
   Scaron   = "Š";
   scaron   = "š";
   Yuml     = "Ÿ";
   fnof     = "ƒ";
   circ     = "ˆ";
   tilde    = "˜";
   ensp     = " ";
   emsp     = " ";
   thinsp   = " ";
   zwnj     = "‌";
   zwj      = "‍";
   lrm      = "‎";
   rlm      = "‏";
   ndash    = "–";
   mdash    = "—";
   lsquo    = "‘";
   rsquo    = "’";
   sbquo    = "‚";
   ldquo    = "“";
   rdquo    = "”";
   bdquo    = "„";
   dagger   = "†";
   Dagger   = "‡";
   bull     = "•";
   hellip   = "…";
   permil   = "‰";
   prime    = "′";
   Prime    = "″";
   lsaquo   = "‹";
   rsaquo   = "›";
   oline    = "‾";
   euro     = "€";
   trade    = "™";
   larr     = "←";
   uarr     = "↑";
   rarr     = "→";
   darr     = "↓";
   harr     = "↔";
   crarr    = "↵";
   lceil    = "⌈";
   rceil    = "⌉";
   lfloor   = "⌊";
   rfloor   = "⌋";
   loz      = "◊";
   spades   = "♠";
   clubs    = "♣";
   hearts   = "♥";
   diams    = "♦";
}

jsx = lpeg.P{
   lpeg.Ct((lpeg.V"element" + lpeg.C(1))^0) / table.concat;
   html_char = lpeg.R("az", "AZ", "09") + "_";
   tag_char = lpeg.V"html_char" + ".";
   html = lpeg.R"az" * lpeg.V"html_char"^0 * #(1 - lpeg.V"tag_char");
   tag = lpeg.R("az", "AZ") * lpeg.V"tag_char"^0;
   js = lpeg.V"element"
      + lpeg.C(1 - lpeg.S"{}")
      + lpeg.V"balanced";
   balanced = lpeg.C"{" * lpeg.V"js"^0 * lpeg.C"}";
   attribute = lpeg.Ct(((lpeg.V"html_char" + "-")^1 / '"%0"')
      * ((lpeg.P"=" / ": ")
	 * (lpeg.C('"' * ((1 - lpeg.P'"') + '\\"')^0 * '"')
	    + (lpeg.P"{" / "(") * lpeg.V"js"^0 * (lpeg.P"}" / ")"))
	 + lpeg.Cc": true")) / table.concat
      + lpeg.Ct("{" * lpeg.V"whitespace"^0 * lpeg.C"..." * lpeg.V"js"^1 * "}") / table.concat;
   whitespace = lpeg.S" \r\n\t";
   element = lpeg.P"<" / "React.createElement("
      * lpeg.V"whitespace"^0
      * ((lpeg.V"html" / '"%0"' + lpeg.C(lpeg.V"tag"))
         * lpeg.Cc", "
         * lpeg.V"whitespace"^0
         * (lpeg.Cc"{" * lpeg.Cf(lpeg.V"attribute"
                                 * (lpeg.V"whitespace"^1 * lpeg.V"attribute")^0,
                                 function(a, b) return a .. ", " .. b end) * lpeg.Cc"}"
            + lpeg.Cc"null")
         * lpeg.V"whitespace"^0
         * (">"
            * lpeg.V"children"
            * "</"
            * lpeg.V"whitespace"^0
            * lpeg.V"tag"
            * lpeg.V"whitespace"^0
            * ">"
            + "/" * lpeg.V"whitespace"^0 * ">")
         + lpeg.P">" / "React.Fragment, null"
         * lpeg.V"children"
         * "<" * lpeg.V"whitespace"^0 * "/" * lpeg.V"whitespace"^0 * ">")
      * lpeg.Cc")";
   letter = lpeg.P'"' / '\\"'
      + "&" * ("#" * lpeg.R"09"^1 / function(ord) return string.char(tonumber(ord)) end
               + lpeg.R("az", "AZ", "09")^1 / entities) * ";"
      + lpeg.C(1 - lpeg.V"whitespace" - lpeg.S"<{");
   word = lpeg.Cc'"'
      * (lpeg.V"whitespace"^1 / " " * lpeg.V"letter"
         + lpeg.V"letter")^1
      * lpeg.Cc'"';
   child = lpeg.V"element"
      + "{" * lpeg.V"js"^1 * "}"
      + lpeg.Ct(lpeg.V"word") / table.concat;
   children = (lpeg.V"whitespace"^1 + lpeg.Cc", " * lpeg.V"child")^0;
}
