require 'spec_helper'

describe TodoList do
  #pending "add some examples to (or delete) #{__FILE__}"
  it { should have_many(:todo_items) }

  describe "#has_complete_items?" do
    let(:todo_list) { TodoList.create(title: "Grooceries", description: "Groocery list") }

    it "is true with completed todo list items" do
      todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(todo_list.has_completed_items?).to be_true
    end 

    it "is false with no completed todo list item" do
      todo_list.todo_items.create(content: "Eggs")
      expect(todo_list.has_completed_items?).to be_false
    end 
  end 
end
