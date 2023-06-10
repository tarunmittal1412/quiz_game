class QuizQuestions
    attr_accessor :question, :answer, :category
    def initialize(ques,ans,cat)
        @question = ques
        @answer = ans
        @category = cat
    end

end