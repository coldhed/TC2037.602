defmodule RegularExpression do
  # define a string with specific delimitators -> sigil
  #   ~s |I said "hello there"|

  # define a regular expression
  #   ~r|\d{1,2}/\d{1,2}/\d{4}|
  #   "4/5/2023" =~ ~r|\d{1,2}/\d{1,2}/\d{4}| -> true
  #   Regex.match?(~r|regex|, "Hello regex") -> true
  #   Regex.run(~r|\d{1,2}/\d{1,2}/\d{4}|, "Today is 4/5/2023") -> ["4/5/2023"]
  #   Regex.replace(~myregex, mystring, "\\3-\\2-\\1") the \\number defines the group that was matched

  def regexTest do
    commentRegex = ~r|^(#.+)|
    equalsRegex = ~r|^(=)|
    stringRegex = ~r|^(".+")|
    functionNameRegex = ~r|^(.+\()|

    Regex.replace(
      commentRegex,
      "a = b + c # this is a comment",
      ~s|<span class="comment">\\1</span>|
    )

    # |> (&Regex.replace(equalsRegex, &1, ~s|<span class=\"operator\">\\1</span>|)).()
  end
end

print("Hello user #3") # comentario

htmlSoFar = <span class="function-name">print(</span>

"Hello user #3") # comentario
htmlSoFar = <span class="function-name">print(</span><span class="string">"Hello user #3"</span>

) # comentario
