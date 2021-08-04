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
  
  def initialize(option)
    @id = option['id']
    @title = option['title']
    @body = option['body']
    @user_id = option['user_id']
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

end

class QuestionFollow

  attr_accessor :id, :q_id, :user_id
  def find_by_id(id)
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








