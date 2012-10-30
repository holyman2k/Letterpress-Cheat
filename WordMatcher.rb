load "Word.rb"
load "Letter.rb"
load "LetterService.rb"
module Match

    def Match.matchWord word, letters

        word.letters.each { |char, letter|
            letterMatch = letters[char]
            if letterMatch == nil
                return false
            end
            if letterMatch.count < letter.count
                return false
            end
        }

        return true
    end

    def Match.filterWord! wordList, letters

        wordList.delete_if {|word|

            result = false;
            letters.each {|char, letter|
                matchedLetter = word.letters[char]
                if matchedLetter == nil || matchedLetter.count < letter.count
                    result = true
                end
            }
            result
        }
        return wordList
    end
end
# wordList = []
# wordList.push Word.new("helllo")
# wordList.push Word.new("testing")
# wordList.push Word.new("texting")
# letters = LetterService.to_letters("et")
# Match.filterWord!(wordList, letters, 3)

# wordList.each { |word|
#     puts word.value
# }