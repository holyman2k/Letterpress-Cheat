load 'Letter.rb'
load 'LetterService.rb'
class Word
    attr_accessor :letters, :value
    def initialize word
        @value = word
        @letters = LetterService.to_letters word
    end

    def findLetter letter
        return letters[letter.value] != nil ? letters[letter.value] : nil
    end

    def to_s
        line = "word ";
        @letters.each { |i,v|
            line += "#{v},"
        }
        return line
    end
end
# puts "loaded Word"
# w = Word.new "helloao"
# puts w.to_s
