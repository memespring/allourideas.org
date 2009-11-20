class Choice < ActiveResource::Base
  self.site = "http://pairwise.heroku.com/questions/:question_id/"
  attr_accessor :name, :question_text, :question_ideas

  def question_id
    prefix_options[:question_id]
  end
  
  def path
    puts "inside Choice#path"
    @earl = Earl.find_by_question_id(self.question_id)
    "/#{@earl.name}/choices/#{id}"
  end
  
  def data
    attributes['data']
  end
  
  def activate!
    puts "about to activate choice, #{self.inspect}"
    self.active = true
    puts "about to save"
    self.save
    puts "saved"
  end
end
