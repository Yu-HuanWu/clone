require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question 
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT *
      FROM questions 
      WHERE id = ?
    SQL
    return nil unless question.length > 0
    Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions 
      WHERE user_id = ?
    SQL
    return nil unless question.length > 0
    question.map {|el| Question.new(el)}
    # Question.new(question.first)
  end

  def initialize(option)
    @id = option['id']
    @title = option['title']
    @body = option['body']
    @user_id = option['user_id']
  end

  def author
    return "#{User.find_by_id(self.user_id).fname} #{User.find_by_id(self.user_id).lname}"
  end

end

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT *
      FROM users 
      WHERE id = ?
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL,fname, lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def initialize(option)
    @id = option['id']
    @fname = option['fname']
    @lname = option['lname']
  end

  def authored_questions
    Question.find_by_author_id(self.id).map.with_index {|el, idx| puts "#{idx+1}. #{el.title}"}
    return self
  end

  def authored_replies
    Reply.find_by_user_id(self.id).map.with_index {|el, idx| puts "#{idx+1}. #{el.body}"}
    return self
  end

end

class QuestionFollow

  attr_accessor :id, :q_id, :user_id
  def self.find_by_id(id)
    questionfollow = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT *
      FROM question_follows 
      WHERE id = ?
    SQL
    return nil unless questionfollow.length > 0
    QuestionFollow.new(questionfollow.first)    
  end

  def initialize(option)
    @id = option['id']
    @q_id = option['q_id']
    @user_id = option['user_id']
  end
end

class Reply
    attr_accessor :id, :pr_id, :q_id, :user_id, :body

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL,id)
            SELECT *
            FROM replies 
            WHERE id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)    
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL,user_id)
            SELECT *
            FROM replies 
            WHERE user_id = ?
        SQL
        return nil unless reply.length > 0
        reply.map {|el| Reply.new(el)}
        # Reply.new(reply.first)   
    end

    def self.find_by_question_id(pr_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, pr_id)
            SELECT *
            FROM replies
            WHERE pr_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def initialize(option)
        @id = option['id']
        @pr_id = option['pr_id']
        @q_id = option['q_id']
        @user_id = option['user_id']
        @body = option['body']
    end
end

class QuestionLike
    attr_accessor :id, :q_id, :user_id

    def self.find_by_id(id)
        questionlike = QuestionsDatabase.instance.execute(<<-SQL,id)
            SELECT *
            FROM question_likes 
            WHERE id = ?
        SQL
        return nil unless questionlike.length > 0
        QuestionLike.new(questionlike.first)    
    end

    def initialize(option)
        @id = option['id']
        @q_id = option['q_id']
        @user_id = option['user_id']
    end
end