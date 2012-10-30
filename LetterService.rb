load "Letter.rb"

module LetterService

    def LetterService.to_letters string
        letters = {}
        begin
            char = string.slice(0);
            if letters[char] == nil
                letters[char] = Letter.new(char)
            else
                letters[char].increment
            end
            string = string.slice(1, string.length)
        end while string.length > 0
        return letters
    end
end

# puts LetterService.to_letters "githubi"