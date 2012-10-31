load 'LetterService.rb'
load 'Word.rb'
load 'WordMatcher.rb'

letters = "fohvlmwybhdoxmvrdllnvityt"
mustHaveLetters = "vx"
minLength = 3;


letterMap = LetterService.to_letters(letters)
dicpath = "brit"
wordlist = []
errors = []
Dir.open(dicpath).each{ |file|

    File.open(File.join(dicpath, file)).each{ |word|
        begin
            wordlist.push Word.new word.strip if word.length => minLength and /[']/.match(word) == nil
        rescue
            errors.push "errored words #{word}"
        end
    } if !/^\./.match file
}

wordlist.each {|word|
    puts word.value
}

# matchList = []

# # create list of words can be made from letters
# wordlist.each { |word|

#     matchList.push word if Match.matchWord word, letterMap
# }

# # filter out using must have words
# Match.filterWord! matchList, LetterService.to_letters(mustHaveLetters) if mustHaveLetters.length > 0

# #sort words by length
# matchList.sort! {|a, b| a.value.length <=> b.value.length}

# output
# matchList.each { |word|
#     puts word.value
# }