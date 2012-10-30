load 'LetterService.rb'
load 'Word.rb'
load 'WordMatcher.rb'

letters = "ihzrzvfrshixqlegplvsunvwl"

mustHaveLetters = ""

puts "letters #{letters}"

letterMap = LetterService.to_letters(letters)
dicpath = "brit"
wordlist = []
errors = []
Dir.open(dicpath).each{ |file|

    File.open(File.join(dicpath, file)).each{ |word|
        begin
            wordlist.push Word.new word.strip if /[']/.match(word) == nil
        rescue
            errors.push "errored words #{word}"
        end
    } if !/^\./.match file
}

matchList = []

wordlist.each { |word|

    matchList.push word if Match.matchWord word, letterMap
}

Match.filterWord! matchList, LetterService.to_letters(mustHaveLetters) if mustHaveLetters.length > 0

matchList.sort! {|a, b|
    a.value.length <=> b.value.length
}

matchList.each { |word|
    puts word.value
}